; DESCRIPTION: Composite: Draws a cyan line from (45, 203) to (156, 26) then Sets a single purple pixel at (486, 106) then Renders a yellow disk with center (420, 102) and radius 73.
; PLAN: r0=45(x1), r1=203(y1), r2=156(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=486(x), r6=106(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=420(x), r11=102(y), r12=73(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 45
LDI r1, 203
LDI r2, 156
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 106
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 420
LDI r11, 102
LDI r12, 73
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
