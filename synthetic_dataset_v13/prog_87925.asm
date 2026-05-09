; DESCRIPTION: Composite: Draws a magenta line from (279, 187) to (76, 92) then Draws a orange circle centered at (40, 145) with radius 37.
; PLAN: r0=279(x1), r1=187(y1), r2=76(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=145(y), r7=37(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 279
LDI r1, 187
LDI r2, 76
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 145
LDI r7, 37
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
