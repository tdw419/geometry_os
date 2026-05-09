; DESCRIPTION: Composite: Creates a magenta circular shape at (119, 104) with radius 62 then Draws a yellow line from (250, 177) to (99, 39).
; PLAN: r0=119(x), r1=104(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x1), r6=177(y1), r7=99(x2), r8=39(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 104
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 177
LDI r7, 99
LDI r8, 39
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
