; DESCRIPTION: Composite: Sets a single green pixel at (17, 11) then Draws a green circle centered at (84, 124) with radius 63 then Renders a orange line between points (173, 67) and (252, 51).
; PLAN: r0=17(x), r1=11(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=84(x), r6=124(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=173(x1), r11=67(y1), r12=252(x2), r13=51(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 17
LDI r1, 11
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 84
LDI r6, 124
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 173
LDI r11, 67
LDI r12, 252
LDI r13, 51
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
