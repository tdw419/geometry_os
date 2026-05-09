; DESCRIPTION: Composite: Renders a white line between points (323, 150) and (506, 230) then Places a black circle of radius 70 at center (253, 141) then Sets a single magenta pixel at (470, 110).
; PLAN: r0=323(x1), r1=150(y1), r2=506(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=141(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=470(x), r11=110(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 323
LDI r1, 150
LDI r2, 506
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 141
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 470
LDI r11, 110
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
