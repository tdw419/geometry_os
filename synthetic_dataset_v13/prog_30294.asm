; DESCRIPTION: Composite: Draws a yellow line from (285, 201) to (94, 152) then Places a green circle of radius 30 at center (437, 159) then Places a yellow dot at position (303, 104).
; PLAN: r0=285(x1), r1=201(y1), r2=94(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=159(y), r7=30(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=303(x), r11=104(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 201
LDI r2, 94
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 159
LDI r7, 30
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 303
LDI r11, 104
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
