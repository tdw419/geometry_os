; DESCRIPTION: Composite: Draws a red line from (38, 20) to (151, 248) then Creates a green circular shape at (248, 101) with radius 58.
; PLAN: r0=38(x1), r1=20(y1), r2=151(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=101(y), r7=58(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 20
LDI r2, 151
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 101
LDI r7, 58
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
