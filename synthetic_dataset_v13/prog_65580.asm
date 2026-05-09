; DESCRIPTION: Composite: Renders a purple line between points (208, 104) and (340, 233) then Creates a cyan circular shape at (392, 33) with radius 23 then Sets a single cyan pixel at (391, 153).
; PLAN: r0=208(x1), r1=104(y1), r2=340(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=33(y), r7=23(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=391(x), r11=153(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 208
LDI r1, 104
LDI r2, 340
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 33
LDI r7, 23
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 391
LDI r11, 153
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
