; DESCRIPTION: Composite: Places a magenta line segment connecting (30, 154) to (93, 102) then Draws a magenta circle centered at (345, 118) with radius 67.
; PLAN: r0=30(x1), r1=154(y1), r2=93(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=118(y), r7=67(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 154
LDI r2, 93
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 118
LDI r7, 67
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
