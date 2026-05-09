; DESCRIPTION: Composite: Draws a red circle centered at (91, 194) with radius 11 then Places a green dot at position (25, 61) then Renders a yellow line between points (34, 178) and (451, 106).
; PLAN: r0=91(x), r1=194(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=61(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=34(x1), r11=178(y1), r12=451(x2), r13=106(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 194
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 61
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 34
LDI r11, 178
LDI r12, 451
LDI r13, 106
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
