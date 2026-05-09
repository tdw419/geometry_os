; DESCRIPTION: Composite: Creates a magenta circular shape at (212, 118) with radius 67 then Draws a yellow line from (147, 51) to (303, 13).
; PLAN: r0=212(x), r1=118(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x1), r6=51(y1), r7=303(x2), r8=13(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 118
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 51
LDI r7, 303
LDI r8, 13
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
