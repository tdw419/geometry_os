; DESCRIPTION: Renders a orange box of size 17x84 starting at (407, 121).
; PLAN: r0=407(x), r1=121(y), r2=17(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 121
LDI r2, 17
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
