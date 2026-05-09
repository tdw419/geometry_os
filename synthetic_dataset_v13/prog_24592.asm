; DESCRIPTION: Composite: Draws a blue circle centered at (135, 49) with radius 46 then Renders a magenta line between points (112, 4) and (118, 144).
; PLAN: r0=135(x), r1=49(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x1), r6=4(y1), r7=118(x2), r8=144(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 49
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 4
LDI r7, 118
LDI r8, 144
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
