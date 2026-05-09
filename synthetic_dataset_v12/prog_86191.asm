; DESCRIPTION: Composite: Places a yellow line segment connecting (341, 149) to (223, 46) then Draws a magenta circle centered at (101, 188) with radius 41.
; PLAN: r0=341(x1), r1=149(y1), r2=223(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=188(y), r7=41(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 149
LDI r2, 223
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 188
LDI r7, 41
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
