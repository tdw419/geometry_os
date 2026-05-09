; DESCRIPTION: Composite: Renders a white line between points (15, 37) and (187, 104) then Creates a magenta circular shape at (451, 99) with radius 59 then Sets a single red pixel at (402, 182).
; PLAN: r0=15(x1), r1=37(y1), r2=187(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=451(x), r6=99(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=402(x), r11=182(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 15
LDI r1, 37
LDI r2, 187
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 99
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 402
LDI r11, 182
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
