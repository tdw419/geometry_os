; DESCRIPTION: Composite: Places a magenta dot at position (211, 54) then Places a green line segment connecting (408, 127) to (218, 155) then Creates a blue circular shape at (285, 161) with radius 30.
; PLAN: r0=211(x), r1=54(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=408(x1), r6=127(y1), r7=218(x2), r8=155(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=285(x), r11=161(y), r12=30(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 54
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 408
LDI r6, 127
LDI r7, 218
LDI r8, 155
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 161
LDI r12, 30
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
