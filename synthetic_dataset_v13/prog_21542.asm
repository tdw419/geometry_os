; DESCRIPTION: Composite: Places a red circle of radius 11 at center (491, 167) then Places a purple line segment connecting (425, 193) to (491, 99) then Sets a single blue pixel at (56, 16).
; PLAN: r0=491(x), r1=167(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x1), r6=193(y1), r7=491(x2), r8=99(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=56(x), r11=16(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 491
LDI r1, 167
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 193
LDI r7, 491
LDI r8, 99
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 16
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
