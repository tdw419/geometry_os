; DESCRIPTION: Composite: Draws a purple line from (414, 77) to (450, 3) then Draws a magenta circle centered at (192, 97) with radius 50.
; PLAN: r0=414(x1), r1=77(y1), r2=450(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=97(y), r7=50(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 414
LDI r1, 77
LDI r2, 450
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 97
LDI r7, 50
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
