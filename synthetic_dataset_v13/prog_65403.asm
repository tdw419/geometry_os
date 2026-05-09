; DESCRIPTION: Composite: Places a yellow circle of radius 34 at center (206, 115) then Places a yellow line segment connecting (124, 51) to (86, 194) then Sets a single orange pixel at (328, 97).
; PLAN: r0=206(x), r1=115(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x1), r6=51(y1), r7=86(x2), r8=194(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=328(x), r11=97(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 206
LDI r1, 115
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 51
LDI r7, 86
LDI r8, 194
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 97
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
