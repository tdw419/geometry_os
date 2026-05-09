; DESCRIPTION: Composite: Renders a magenta line between points (23, 95) and (79, 91) then Draws a yellow circle centered at (412, 136) with radius 19.
; PLAN: r0=23(x1), r1=95(y1), r2=79(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=136(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 23
LDI r1, 95
LDI r2, 79
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 136
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
