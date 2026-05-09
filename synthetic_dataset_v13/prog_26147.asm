; DESCRIPTION: Composite: Renders a blue disk with center (194, 198) and radius 57 then Renders a magenta line between points (144, 101) and (446, 158) then Sets a single purple pixel at (139, 41).
; PLAN: r0=194(x), r1=198(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x1), r6=101(y1), r7=446(x2), r8=158(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=41(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 194
LDI r1, 198
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 101
LDI r7, 446
LDI r8, 158
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 41
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
