; DESCRIPTION: Composite: Renders a blue line between points (236, 120) and (362, 143) then Places a magenta dot at position (136, 176) then Places a purple circle of radius 41 at center (277, 75).
; PLAN: r0=236(x1), r1=120(y1), r2=362(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=136(x), r6=176(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=277(x), r11=75(y), r12=41(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 236
LDI r1, 120
LDI r2, 362
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 176
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 277
LDI r11, 75
LDI r12, 41
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
