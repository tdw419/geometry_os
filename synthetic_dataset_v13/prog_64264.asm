; DESCRIPTION: Creates a yellow rectangular region at (22, 130) spanning 66 by 83 pixels.
; PLAN: r0=22(x), r1=130(y), r2=66(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 130
LDI r2, 66
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
