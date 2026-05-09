; DESCRIPTION: Composite: Renders a magenta line between points (303, 136) and (221, 181) then Draws a yellow circle centered at (260, 127) with radius 66.
; PLAN: r0=303(x1), r1=136(y1), r2=221(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=127(y), r7=66(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 303
LDI r1, 136
LDI r2, 221
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 127
LDI r7, 66
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
