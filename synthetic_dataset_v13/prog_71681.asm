; DESCRIPTION: Renders a orange box of size 17x88 starting at (441, 163).
; PLAN: r0=441(x), r1=163(y), r2=17(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 163
LDI r2, 17
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
