; DESCRIPTION: Composite: Renders a black line between points (312, 229) and (15, 130) then Draws a black circle centered at (263, 87) with radius 36 then Sets a single magenta pixel at (485, 38).
; PLAN: r0=312(x1), r1=229(y1), r2=15(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=87(y), r7=36(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=485(x), r11=38(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 229
LDI r2, 15
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 87
LDI r7, 36
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 485
LDI r11, 38
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
