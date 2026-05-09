; DESCRIPTION: Composite: Sets a single yellow pixel at (30, 186) then Draws a black line from (461, 104) to (416, 201) then Places a black circle of radius 13 at center (439, 16).
; PLAN: r0=30(x), r1=186(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=461(x1), r6=104(y1), r7=416(x2), r8=201(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=439(x), r11=16(y), r12=13(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 30
LDI r1, 186
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 461
LDI r6, 104
LDI r7, 416
LDI r8, 201
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 16
LDI r12, 13
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
