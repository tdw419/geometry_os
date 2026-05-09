; DESCRIPTION: Composite: Renders a white line between points (201, 63) and (490, 188) then Creates a blue circular shape at (223, 52) with radius 28 then Sets a single red pixel at (396, 111).
; PLAN: r0=201(x1), r1=63(y1), r2=490(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=52(y), r7=28(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=111(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 201
LDI r1, 63
LDI r2, 490
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 52
LDI r7, 28
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 111
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
