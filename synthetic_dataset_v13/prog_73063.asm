; DESCRIPTION: Composite: Sets a single magenta pixel at (405, 198) then Renders a purple line between points (72, 28) and (238, 65) then Creates a yellow circular shape at (95, 75) with radius 37.
; PLAN: r0=405(x), r1=198(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=72(x1), r6=28(y1), r7=238(x2), r8=65(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=95(x), r11=75(y), r12=37(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 405
LDI r1, 198
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 28
LDI r7, 238
LDI r8, 65
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 75
LDI r12, 37
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
