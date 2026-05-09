; DESCRIPTION: Composite: Creates a yellow rectangular region at (47, 72) spanning 119 by 44 pixels then Places a blue line segment connecting (122, 4) to (127, 254) then Places a white dot at position (129, 85).
; PLAN: r0=47(x), r1=72(y), r2=119(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x1), r6=4(y1), r7=127(x2), r8=254(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=85(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 47
LDI r1, 72
LDI r2, 119
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 4
LDI r7, 127
LDI r8, 254
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 85
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
