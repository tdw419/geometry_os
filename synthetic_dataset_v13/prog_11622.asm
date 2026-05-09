; DESCRIPTION: Composite: Renders a black line between points (494, 63) and (95, 219) then Creates a orange circular shape at (127, 196) with radius 24 then Sets a single blue pixel at (295, 78).
; PLAN: r0=494(x1), r1=63(y1), r2=95(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=196(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x), r11=78(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 494
LDI r1, 63
LDI r2, 95
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 196
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 78
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
