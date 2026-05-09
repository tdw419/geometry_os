; DESCRIPTION: Composite: Renders a cyan disk with center (66, 136) and radius 10 then Renders a purple line between points (447, 104) and (339, 8) then Sets a single orange pixel at (175, 34).
; PLAN: r0=66(x), r1=136(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x1), r6=104(y1), r7=339(x2), r8=8(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=175(x), r11=34(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 66
LDI r1, 136
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 104
LDI r7, 339
LDI r8, 8
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 34
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
