; DESCRIPTION: Composite: Places a white line segment connecting (112, 206) to (432, 219) then Draws a purple circle centered at (333, 106) with radius 47.
; PLAN: r0=112(x1), r1=206(y1), r2=432(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=106(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 112
LDI r1, 206
LDI r2, 432
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 106
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
