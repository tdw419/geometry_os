; DESCRIPTION: Composite: Places a green dot at position (505, 92) then Draws a red line from (3, 94) to (100, 160) then Renders a yellow disk with center (202, 150) and radius 35.
; PLAN: r0=505(x), r1=92(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=3(x1), r6=94(y1), r7=100(x2), r8=160(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=150(y), r12=35(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 505
LDI r1, 92
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 3
LDI r6, 94
LDI r7, 100
LDI r8, 160
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 150
LDI r12, 35
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
