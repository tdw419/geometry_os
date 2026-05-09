; DESCRIPTION: Composite: Renders a purple line between points (295, 162) and (82, 160) then Places a black dot at position (453, 113) then Renders a red disk with center (211, 158) and radius 34.
; PLAN: r0=295(x1), r1=162(y1), r2=82(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=113(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=211(x), r11=158(y), r12=34(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 295
LDI r1, 162
LDI r2, 82
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 113
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 211
LDI r11, 158
LDI r12, 34
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
