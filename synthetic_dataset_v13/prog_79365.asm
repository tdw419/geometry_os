; DESCRIPTION: Composite: Places a green dot at position (106, 220) then Draws a red circle centered at (430, 175) with radius 15 then Renders a black line between points (149, 207) and (101, 44).
; PLAN: r0=106(x), r1=220(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=430(x), r6=175(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=149(x1), r11=207(y1), r12=101(x2), r13=44(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 220
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 430
LDI r6, 175
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 149
LDI r11, 207
LDI r12, 101
LDI r13, 44
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
