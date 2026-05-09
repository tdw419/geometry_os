; DESCRIPTION: Composite: Draws a yellow circle centered at (173, 131) with radius 37 then Places a cyan line segment connecting (351, 164) to (248, 156) then Places a cyan dot at position (225, 158).
; PLAN: r0=173(x), r1=131(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x1), r6=164(y1), r7=248(x2), r8=156(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=158(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 173
LDI r1, 131
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 164
LDI r7, 248
LDI r8, 156
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 158
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
