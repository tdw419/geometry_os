; DESCRIPTION: Composite: Places a white dot at position (392, 40) then Draws a blue line from (35, 158) to (25, 127) then Places a blue circle of radius 26 at center (457, 114).
; PLAN: r0=392(x), r1=40(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=35(x1), r6=158(y1), r7=25(x2), r8=127(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=457(x), r11=114(y), r12=26(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 392
LDI r1, 40
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 35
LDI r6, 158
LDI r7, 25
LDI r8, 127
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 114
LDI r12, 26
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
