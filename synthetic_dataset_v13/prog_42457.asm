; DESCRIPTION: Composite: Sets a single orange pixel at (42, 112) then Draws a orange line from (177, 32) to (210, 99) then Creates a magenta circular shape at (62, 138) with radius 23.
; PLAN: r0=42(x), r1=112(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=177(x1), r6=32(y1), r7=210(x2), r8=99(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=62(x), r11=138(y), r12=23(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 42
LDI r1, 112
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 177
LDI r6, 32
LDI r7, 210
LDI r8, 99
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 138
LDI r12, 23
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
