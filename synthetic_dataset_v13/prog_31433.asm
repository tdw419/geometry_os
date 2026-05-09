; DESCRIPTION: Composite: Places a yellow 120x95 rectangle at position (259, 110) then Places a black line segment connecting (66, 226) to (389, 147) then Sets a single orange pixel at (183, 131).
; PLAN: r0=259(x), r1=110(y), r2=120(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x1), r6=226(y1), r7=389(x2), r8=147(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=183(x), r11=131(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 259
LDI r1, 110
LDI r2, 120
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 226
LDI r7, 389
LDI r8, 147
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 131
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
