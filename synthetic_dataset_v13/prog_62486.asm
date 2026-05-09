; DESCRIPTION: Renders a orange box of size 88x84 starting at (105, 129).
; PLAN: r0=105(x), r1=129(y), r2=88(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 129
LDI r2, 88
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
