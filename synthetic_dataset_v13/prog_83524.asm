; DESCRIPTION: Creates a blue rectangular region at (164, 130) spanning 81 by 62 pixels.
; PLAN: r0=164(x), r1=130(y), r2=81(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 130
LDI r2, 81
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
