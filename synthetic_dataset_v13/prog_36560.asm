; DESCRIPTION: Composite: Places a purple dot at position (107, 210) then Draws a red line from (258, 44) to (157, 198) then Renders a purple disk with center (277, 115) and radius 46.
; PLAN: r0=107(x), r1=210(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=258(x1), r6=44(y1), r7=157(x2), r8=198(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=277(x), r11=115(y), r12=46(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 107
LDI r1, 210
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 258
LDI r6, 44
LDI r7, 157
LDI r8, 198
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 115
LDI r12, 46
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
