; DESCRIPTION: Composite: Sets a single green pixel at (131, 186) then Places a purple line segment connecting (308, 94) to (307, 20) then Creates a black circular shape at (393, 48) with radius 32.
; PLAN: r0=131(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=308(x1), r6=94(y1), r7=307(x2), r8=20(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=393(x), r11=48(y), r12=32(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 186
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 308
LDI r6, 94
LDI r7, 307
LDI r8, 20
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 48
LDI r12, 32
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
