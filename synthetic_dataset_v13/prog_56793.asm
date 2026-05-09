; DESCRIPTION: Composite: Creates a green circular shape at (358, 160) with radius 79 then Draws a blue line from (197, 136) to (68, 162).
; PLAN: r0=358(x), r1=160(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x1), r6=136(y1), r7=68(x2), r8=162(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 160
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 136
LDI r7, 68
LDI r8, 162
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
