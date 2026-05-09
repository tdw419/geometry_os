; DESCRIPTION: Composite: Renders a yellow line between points (270, 147) and (257, 108) then Renders a blue disk with center (467, 197) and radius 37 then Sets a single green pixel at (307, 196).
; PLAN: r0=270(x1), r1=147(y1), r2=257(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=197(y), r7=37(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x), r11=196(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 270
LDI r1, 147
LDI r2, 257
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 197
LDI r7, 37
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 196
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
