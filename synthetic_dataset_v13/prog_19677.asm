; DESCRIPTION: Composite: Places a purple dot at position (145, 75) then Places a green line segment connecting (193, 28) to (369, 16) then Draws a white circle centered at (221, 222) with radius 23.
; PLAN: r0=145(x), r1=75(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=193(x1), r6=28(y1), r7=369(x2), r8=16(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=222(y), r12=23(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 145
LDI r1, 75
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 193
LDI r6, 28
LDI r7, 369
LDI r8, 16
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 222
LDI r12, 23
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
