; DESCRIPTION: Composite: Renders a purple line between points (290, 37) and (183, 208) then Places a yellow dot at position (463, 186) then Places a red circle of radius 65 at center (126, 121).
; PLAN: r0=290(x1), r1=37(y1), r2=183(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=186(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=121(y), r12=65(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 37
LDI r2, 183
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 186
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 126
LDI r11, 121
LDI r12, 65
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
