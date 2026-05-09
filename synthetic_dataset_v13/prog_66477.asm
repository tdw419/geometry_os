; DESCRIPTION: Composite: Sets a single orange pixel at (185, 79) then Renders a yellow box of size 55x107 starting at (323, 26) then Creates a magenta circular shape at (100, 84) with radius 18.
; PLAN: r0=185(x), r1=79(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=323(x), r6=26(y), r7=55(width), r8=107(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=100(x), r11=84(y), r12=18(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 185
LDI r1, 79
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 323
LDI r6, 26
LDI r7, 55
LDI r8, 107
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 84
LDI r12, 18
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
