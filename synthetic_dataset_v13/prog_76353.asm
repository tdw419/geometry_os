; DESCRIPTION: Renders a orange box of size 88x33 starting at (43, 155).
; PLAN: r0=43(x), r1=155(y), r2=88(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 155
LDI r2, 88
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
