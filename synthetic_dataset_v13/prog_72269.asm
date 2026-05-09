; DESCRIPTION: Composite: Creates a green rectangular region at (371, 81) spanning 16 by 107 pixels then Renders a purple disk with center (219, 136) and radius 36.
; PLAN: r0=371(x), r1=81(y), r2=16(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x), r6=136(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 371
LDI r1, 81
LDI r2, 16
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 136
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
