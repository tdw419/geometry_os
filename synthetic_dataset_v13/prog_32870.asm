; DESCRIPTION: Composite: Places a yellow dot at position (492, 114) then Renders a orange line between points (493, 140) and (216, 234) then Places a red circle of radius 68 at center (353, 167).
; PLAN: r0=492(x), r1=114(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=493(x1), r6=140(y1), r7=216(x2), r8=234(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=167(y), r12=68(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 492
LDI r1, 114
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 493
LDI r6, 140
LDI r7, 216
LDI r8, 234
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 167
LDI r12, 68
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
