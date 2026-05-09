; DESCRIPTION: Renders a orange box of size 57x76 starting at (47, 9).
; PLAN: r0=47(x), r1=9(y), r2=57(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 9
LDI r2, 57
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
