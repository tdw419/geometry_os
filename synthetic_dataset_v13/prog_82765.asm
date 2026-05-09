; DESCRIPTION: Composite: Renders a yellow line between points (110, 2) and (16, 104) then Sets a single blue pixel at (304, 240).
; PLAN: r0=110(x1), r1=2(y1), r2=16(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=240(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 110
LDI r1, 2
LDI r2, 16
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 240
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
