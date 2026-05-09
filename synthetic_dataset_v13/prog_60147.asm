; DESCRIPTION: Composite: Draws a black line from (508, 246) to (274, 227) then Places a blue dot at position (242, 127) then Renders a magenta disk with center (126, 149) and radius 49.
; PLAN: r0=508(x1), r1=246(y1), r2=274(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=127(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=149(y), r12=49(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 508
LDI r1, 246
LDI r2, 274
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 127
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 126
LDI r11, 149
LDI r12, 49
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
