; DESCRIPTION: Composite: Draws a green line from (309, 158) to (10, 219) then Places a cyan dot at position (261, 26) then Places a purple circle of radius 80 at center (345, 154).
; PLAN: r0=309(x1), r1=158(y1), r2=10(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=26(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=345(x), r11=154(y), r12=80(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 309
LDI r1, 158
LDI r2, 10
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 26
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 345
LDI r11, 154
LDI r12, 80
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
