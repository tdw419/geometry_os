; DESCRIPTION: Composite: Places a blue dot at position (131, 115) then Renders a orange line between points (461, 90) and (114, 139) then Draws a yellow circle centered at (386, 56) with radius 43.
; PLAN: r0=131(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=461(x1), r6=90(y1), r7=114(x2), r8=139(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=56(y), r12=43(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 115
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 461
LDI r6, 90
LDI r7, 114
LDI r8, 139
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 56
LDI r12, 43
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
