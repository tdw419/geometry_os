; DESCRIPTION: Composite: Places a yellow dot at position (308, 127) then Renders a magenta line between points (164, 40) and (10, 59) then Renders a blue disk with center (288, 110) and radius 38.
; PLAN: r0=308(x), r1=127(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=164(x1), r6=40(y1), r7=10(x2), r8=59(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=288(x), r11=110(y), r12=38(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 127
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 164
LDI r6, 40
LDI r7, 10
LDI r8, 59
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 110
LDI r12, 38
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
