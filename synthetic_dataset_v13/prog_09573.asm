; DESCRIPTION: Composite: Renders a magenta disk with center (83, 214) and radius 36 then Renders a white line between points (131, 3) and (101, 50) then Sets a single green pixel at (417, 201).
; PLAN: r0=83(x), r1=214(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x1), r6=3(y1), r7=101(x2), r8=50(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=417(x), r11=201(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 83
LDI r1, 214
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 3
LDI r7, 101
LDI r8, 50
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 201
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
