; DESCRIPTION: Composite: Places a purple dot at position (473, 213) then Renders a blue line between points (292, 147) and (274, 5) then Renders a yellow disk with center (392, 156) and radius 49.
; PLAN: r0=473(x), r1=213(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=292(x1), r6=147(y1), r7=274(x2), r8=5(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=392(x), r11=156(y), r12=49(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 473
LDI r1, 213
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 147
LDI r7, 274
LDI r8, 5
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 156
LDI r12, 49
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
