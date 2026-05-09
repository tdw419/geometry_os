; DESCRIPTION: Creates a yellow rectangular region at (160, 24) spanning 88 by 105 pixels.
; PLAN: r0=160(x), r1=24(y), r2=88(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 24
LDI r2, 88
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
