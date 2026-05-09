; DESCRIPTION: Composite: Sets a single magenta pixel at (192, 223) then Renders a yellow line between points (26, 18) and (139, 8) then Places a magenta 41x119 rectangle at position (390, 77).
; PLAN: r0=192(x), r1=223(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=26(x1), r6=18(y1), r7=139(x2), r8=8(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=77(y), r12=41(width), r13=119(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 223
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 26
LDI r6, 18
LDI r7, 139
LDI r8, 8
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 77
LDI r12, 41
LDI r13, 119
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
