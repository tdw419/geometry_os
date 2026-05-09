; DESCRIPTION: Composite: Draws a yellow line from (211, 4) to (156, 6) then Creates a blue circular shape at (104, 114) with radius 79.
; PLAN: r0=211(x1), r1=4(y1), r2=156(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=114(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 211
LDI r1, 4
LDI r2, 156
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 114
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
