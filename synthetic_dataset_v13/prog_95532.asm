; DESCRIPTION: Composite: Sets a single cyan pixel at (45, 192) then Places a white circle of radius 24 at center (137, 75) then Draws a orange line from (321, 163) to (26, 188).
; PLAN: r0=45(x), r1=192(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=75(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=321(x1), r11=163(y1), r12=26(x2), r13=188(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 192
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 137
LDI r6, 75
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 321
LDI r11, 163
LDI r12, 26
LDI r13, 188
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
