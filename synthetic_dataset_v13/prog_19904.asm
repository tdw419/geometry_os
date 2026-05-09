; DESCRIPTION: Composite: Places a red circle of radius 58 at center (245, 101) then Renders a green line between points (134, 172) and (166, 238) then Sets a single red pixel at (230, 149).
; PLAN: r0=245(x), r1=101(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x1), r6=172(y1), r7=166(x2), r8=238(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=230(x), r11=149(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 101
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 172
LDI r7, 166
LDI r8, 238
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 149
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
