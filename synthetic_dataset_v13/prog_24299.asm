; DESCRIPTION: Composite: Places a magenta dot at position (290, 149) then Places a white line segment connecting (100, 75) to (142, 157) then Draws a yellow circle centered at (237, 78) with radius 78.
; PLAN: r0=290(x), r1=149(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=100(x1), r6=75(y1), r7=142(x2), r8=157(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=78(y), r12=78(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 149
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 75
LDI r7, 142
LDI r8, 157
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 78
LDI r12, 78
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
