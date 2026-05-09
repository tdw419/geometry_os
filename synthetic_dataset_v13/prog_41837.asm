; DESCRIPTION: Composite: Places a blue line segment connecting (211, 156) to (327, 254) then Places a red dot at position (501, 250) then Draws a white circle centered at (198, 124) with radius 80.
; PLAN: r0=211(x1), r1=156(y1), r2=327(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=501(x), r6=250(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=198(x), r11=124(y), r12=80(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 156
LDI r2, 327
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 250
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 198
LDI r11, 124
LDI r12, 80
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
