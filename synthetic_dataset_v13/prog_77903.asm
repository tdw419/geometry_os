; DESCRIPTION: Composite: Sets a single cyan pixel at (495, 135) then Creates a green circular shape at (290, 45) with radius 33 then Renders a black line between points (358, 88) and (63, 153).
; PLAN: r0=495(x), r1=135(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=45(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=358(x1), r11=88(y1), r12=63(x2), r13=153(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 495
LDI r1, 135
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 290
LDI r6, 45
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 358
LDI r11, 88
LDI r12, 63
LDI r13, 153
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
