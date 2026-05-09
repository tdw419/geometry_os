; DESCRIPTION: Composite: Sets a single black pixel at (471, 133) then Renders a yellow line between points (105, 161) and (329, 87) then Places a red circle of radius 79 at center (191, 104).
; PLAN: r0=471(x), r1=133(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=105(x1), r6=161(y1), r7=329(x2), r8=87(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=191(x), r11=104(y), r12=79(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 471
LDI r1, 133
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 105
LDI r6, 161
LDI r7, 329
LDI r8, 87
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 104
LDI r12, 79
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
