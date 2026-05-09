; DESCRIPTION: Creates a blue rectangular region at (377, 130) spanning 24 by 107 pixels.
; PLAN: r0=377(x), r1=130(y), r2=24(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 130
LDI r2, 24
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
