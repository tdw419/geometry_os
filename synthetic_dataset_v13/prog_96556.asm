; DESCRIPTION: Composite: Draws a yellow line from (221, 4) to (246, 15) then Renders a magenta disk with center (430, 147) and radius 79.
; PLAN: r0=221(x1), r1=4(y1), r2=246(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=147(y), r7=79(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 221
LDI r1, 4
LDI r2, 246
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 147
LDI r7, 79
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
