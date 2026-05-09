; DESCRIPTION: Composite: Renders a red disk with center (432, 123) and radius 36 then Places a purple dot at position (486, 182) then Draws a yellow line from (388, 0) to (222, 250).
; PLAN: r0=432(x), r1=123(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=486(x), r6=182(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=388(x1), r11=0(y1), r12=222(x2), r13=250(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 123
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 486
LDI r6, 182
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 388
LDI r11, 0
LDI r12, 222
LDI r13, 250
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
