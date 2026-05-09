; DESCRIPTION: Composite: Draws a green rectangle at (333, 136) with width 61 and height 32 then Renders a blue disk with center (390, 45) and radius 33.
; PLAN: r0=333(x), r1=136(y), r2=61(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=45(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 333
LDI r1, 136
LDI r2, 61
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 45
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
