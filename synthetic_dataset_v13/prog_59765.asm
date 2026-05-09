; DESCRIPTION: Creates a green rectangular region at (163, 130) spanning 53 by 88 pixels.
; PLAN: r0=163(x), r1=130(y), r2=53(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 130
LDI r2, 53
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
