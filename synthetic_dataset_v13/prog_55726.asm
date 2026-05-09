; DESCRIPTION: Composite: Places a red line segment connecting (146, 169) to (161, 127) then Draws a cyan circle centered at (296, 106) with radius 25.
; PLAN: r0=146(x1), r1=169(y1), r2=161(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=106(y), r7=25(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 146
LDI r1, 169
LDI r2, 161
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 106
LDI r7, 25
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
