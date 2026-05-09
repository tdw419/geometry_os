; DESCRIPTION: Composite: Sets a single magenta pixel at (28, 119) then Renders a orange line between points (131, 230) and (241, 6) then Creates a red circular shape at (486, 212) with radius 18.
; PLAN: r0=28(x), r1=119(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=131(x1), r6=230(y1), r7=241(x2), r8=6(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=486(x), r11=212(y), r12=18(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 28
LDI r1, 119
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 230
LDI r7, 241
LDI r8, 6
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 486
LDI r11, 212
LDI r12, 18
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
