; DESCRIPTION: Composite: Draws a purple line from (508, 164) to (188, 160) then Creates a red circular shape at (255, 183) with radius 63.
; PLAN: r0=508(x1), r1=164(y1), r2=188(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=183(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 508
LDI r1, 164
LDI r2, 188
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 183
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
