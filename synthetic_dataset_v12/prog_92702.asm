; DESCRIPTION: Composite: Places a red line segment connecting (500, 223) to (218, 44) then Draws a green circle centered at (158, 121) with radius 18 then Sets a single red pixel at (38, 194).
; PLAN: r0=500(x1), r1=223(y1), r2=218(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=121(y), r7=18(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x), r11=194(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 500
LDI r1, 223
LDI r2, 218
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 121
LDI r7, 18
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 194
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
