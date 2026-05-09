; DESCRIPTION: Composite: Draws a green line from (3, 69) to (106, 233) then Creates a yellow circular shape at (395, 147) with radius 43.
; PLAN: r0=3(x1), r1=69(y1), r2=106(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=147(y), r7=43(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 69
LDI r2, 106
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 147
LDI r7, 43
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
