; DESCRIPTION: Composite: Sets a single white pixel at (462, 114) then Draws a blue line from (145, 3) to (233, 133) then Creates a orange circular shape at (209, 78) with radius 72.
; PLAN: r0=462(x), r1=114(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=145(x1), r6=3(y1), r7=233(x2), r8=133(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=209(x), r11=78(y), r12=72(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 462
LDI r1, 114
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 145
LDI r6, 3
LDI r7, 233
LDI r8, 133
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 78
LDI r12, 72
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
