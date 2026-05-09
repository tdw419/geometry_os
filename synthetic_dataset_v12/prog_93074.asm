; DESCRIPTION: Composite: Places a purple line segment connecting (109, 132) to (473, 131) then Draws a green circle centered at (190, 85) with radius 72.
; PLAN: r0=109(x1), r1=132(y1), r2=473(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=85(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 132
LDI r2, 473
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 85
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
