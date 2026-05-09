; DESCRIPTION: Composite: Places a blue dot at position (149, 100) then Draws a cyan line from (331, 46) to (465, 176) then Creates a magenta circular shape at (139, 29) with radius 12.
; PLAN: r0=149(x), r1=100(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=46(y1), r7=465(x2), r8=176(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=29(y), r12=12(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 149
LDI r1, 100
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 331
LDI r6, 46
LDI r7, 465
LDI r8, 176
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 29
LDI r12, 12
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
