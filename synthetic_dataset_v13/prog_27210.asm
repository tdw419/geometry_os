; DESCRIPTION: Composite: Places a black dot at position (305, 122) then Renders a yellow line between points (418, 149) and (41, 204) then Draws a yellow circle centered at (132, 198) with radius 54.
; PLAN: r0=305(x), r1=122(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=418(x1), r6=149(y1), r7=41(x2), r8=204(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=198(y), r12=54(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 305
LDI r1, 122
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 418
LDI r6, 149
LDI r7, 41
LDI r8, 204
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 198
LDI r12, 54
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
