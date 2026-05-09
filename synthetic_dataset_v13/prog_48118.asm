; DESCRIPTION: Renders a orange box of size 84x77 starting at (11, 117).
; PLAN: r0=11(x), r1=117(y), r2=84(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 117
LDI r2, 84
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
