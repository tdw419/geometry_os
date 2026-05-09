; DESCRIPTION: Composite: Draws a red line from (1, 106) to (135, 107) then Renders a red disk with center (148, 37) and radius 14 then Sets a single yellow pixel at (314, 144).
; PLAN: r0=1(x1), r1=106(y1), r2=135(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=37(y), r7=14(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x), r11=144(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 1
LDI r1, 106
LDI r2, 135
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 37
LDI r7, 14
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 144
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
