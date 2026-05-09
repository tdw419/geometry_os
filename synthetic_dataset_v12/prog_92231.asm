; DESCRIPTION: Renders a orange box of size 85x77 starting at (327, 48).
; PLAN: r0=327(x), r1=48(y), r2=85(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 48
LDI r2, 85
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
