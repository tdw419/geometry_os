; DESCRIPTION: Composite: Sets a single magenta pixel at (350, 104) then Draws a green line from (438, 136) to (298, 201).
; PLAN: r0=350(x), r1=104(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=438(x1), r6=136(y1), r7=298(x2), r8=201(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 104
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 438
LDI r6, 136
LDI r7, 298
LDI r8, 201
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
