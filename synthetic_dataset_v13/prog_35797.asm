; DESCRIPTION: Composite: Draws a red line from (287, 110) to (411, 38) then Renders a green disk with center (91, 157) and radius 10 then Sets a single yellow pixel at (229, 88).
; PLAN: r0=287(x1), r1=110(y1), r2=411(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=157(y), r7=10(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=229(x), r11=88(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 287
LDI r1, 110
LDI r2, 411
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 157
LDI r7, 10
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 229
LDI r11, 88
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
