; DESCRIPTION: Composite: Draws a cyan line from (121, 123) to (128, 147) then Places a red dot at position (188, 46) then Places a purple circle of radius 49 at center (81, 149).
; PLAN: r0=121(x1), r1=123(y1), r2=128(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=46(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=81(x), r11=149(y), r12=49(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 123
LDI r2, 128
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 46
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 81
LDI r11, 149
LDI r12, 49
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
