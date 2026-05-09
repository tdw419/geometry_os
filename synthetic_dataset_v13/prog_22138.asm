; DESCRIPTION: Composite: Draws a yellow line from (109, 228) to (260, 208) then Places a orange circle of radius 55 at center (162, 194) then Places a red dot at position (427, 158).
; PLAN: r0=109(x1), r1=228(y1), r2=260(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=194(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=427(x), r11=158(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 109
LDI r1, 228
LDI r2, 260
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 194
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 427
LDI r11, 158
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
