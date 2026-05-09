; DESCRIPTION: Composite: Renders a yellow line between points (301, 181) and (17, 138) then Draws a magenta circle centered at (138, 80) with radius 58.
; PLAN: r0=301(x1), r1=181(y1), r2=17(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=80(y), r7=58(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 181
LDI r2, 17
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 80
LDI r7, 58
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
