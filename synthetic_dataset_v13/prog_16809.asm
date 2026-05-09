; DESCRIPTION: Composite: Renders a green disk with center (360, 95) and radius 62 then Draws a red line from (163, 163) to (366, 105).
; PLAN: r0=360(x), r1=95(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x1), r6=163(y1), r7=366(x2), r8=105(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 95
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 163
LDI r7, 366
LDI r8, 105
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
