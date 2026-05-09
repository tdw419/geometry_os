; DESCRIPTION: Composite: Draws a magenta line from (497, 24) to (94, 97) then Creates a blue circular shape at (273, 19) with radius 15.
; PLAN: r0=497(x1), r1=24(y1), r2=94(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=19(y), r7=15(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 497
LDI r1, 24
LDI r2, 94
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 19
LDI r7, 15
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
