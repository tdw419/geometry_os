; DESCRIPTION: Composite: Places a orange dot at position (427, 250) then Creates a yellow circular shape at (406, 68) with radius 45 then Places a magenta line segment connecting (96, 130) to (318, 236).
; PLAN: r0=427(x), r1=250(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=68(y), r7=45(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=96(x1), r11=130(y1), r12=318(x2), r13=236(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 427
LDI r1, 250
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 406
LDI r6, 68
LDI r7, 45
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 96
LDI r11, 130
LDI r12, 318
LDI r13, 236
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
