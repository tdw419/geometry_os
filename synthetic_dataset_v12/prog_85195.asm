; DESCRIPTION: Composite: Places a magenta line segment connecting (175, 35) to (240, 109) then Places a orange dot at position (184, 234) then Creates a cyan circular shape at (91, 121) with radius 36.
; PLAN: r0=175(x1), r1=35(y1), r2=240(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=234(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=91(x), r11=121(y), r12=36(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 35
LDI r2, 240
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 234
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 91
LDI r11, 121
LDI r12, 36
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
