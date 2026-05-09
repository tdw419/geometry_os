; DESCRIPTION: Composite: Renders a blue line between points (384, 198) and (147, 235) then Creates a cyan circular shape at (144, 230) with radius 13 then Sets a single red pixel at (306, 35).
; PLAN: r0=384(x1), r1=198(y1), r2=147(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=230(y), r7=13(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=35(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 384
LDI r1, 198
LDI r2, 147
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 230
LDI r7, 13
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 35
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
