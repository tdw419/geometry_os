; DESCRIPTION: Creates a yellow rectangular region at (56, 130) spanning 49 by 81 pixels.
; PLAN: r0=56(x), r1=130(y), r2=49(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 130
LDI r2, 49
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
