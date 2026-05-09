; DESCRIPTION: Composite: Renders a green line between points (229, 107) and (163, 145) then Draws a black circle centered at (344, 194) with radius 10.
; PLAN: r0=229(x1), r1=107(y1), r2=163(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=194(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 229
LDI r1, 107
LDI r2, 163
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 194
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
