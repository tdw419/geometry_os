; DESCRIPTION: Composite: Draws a blue rectangle at (307, 176) with width 87 and height 57 then Sets a single green pixel at (297, 232) then Renders a yellow disk with center (480, 74) and radius 13.
; PLAN: r0=307(x), r1=176(y), r2=87(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x), r6=232(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=480(x), r11=74(y), r12=13(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 176
LDI r2, 87
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 232
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 480
LDI r11, 74
LDI r12, 13
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
