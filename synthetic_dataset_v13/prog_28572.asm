; DESCRIPTION: Composite: Places a red circle of radius 78 at center (388, 156) then Draws a purple line from (158, 74) to (223, 144) then Sets a single magenta pixel at (24, 163).
; PLAN: r0=388(x), r1=156(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x1), r6=74(y1), r7=223(x2), r8=144(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=24(x), r11=163(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 388
LDI r1, 156
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 74
LDI r7, 223
LDI r8, 144
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 24
LDI r11, 163
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
