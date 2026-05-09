; DESCRIPTION: Composite: Sets a single red pixel at (467, 11) then Draws a magenta circle centered at (425, 102) with radius 74 then Draws a orange line from (220, 85) to (323, 35).
; PLAN: r0=467(x), r1=11(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=102(y), r7=74(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=220(x1), r11=85(y1), r12=323(x2), r13=35(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 11
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 425
LDI r6, 102
LDI r7, 74
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 220
LDI r11, 85
LDI r12, 323
LDI r13, 35
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
