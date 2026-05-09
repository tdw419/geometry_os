; DESCRIPTION: Composite: Places a red dot at position (411, 25) then Renders a red line between points (70, 160) and (321, 28) then Creates a green circular shape at (108, 145) with radius 70.
; PLAN: r0=411(x), r1=25(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=70(x1), r6=160(y1), r7=321(x2), r8=28(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=108(x), r11=145(y), r12=70(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 411
LDI r1, 25
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 70
LDI r6, 160
LDI r7, 321
LDI r8, 28
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 145
LDI r12, 70
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
