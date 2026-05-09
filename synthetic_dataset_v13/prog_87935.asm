; DESCRIPTION: Composite: Places a cyan line segment connecting (6, 52) to (485, 21) then Renders a white disk with center (78, 145) and radius 35 then Sets a single magenta pixel at (248, 19).
; PLAN: r0=6(x1), r1=52(y1), r2=485(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=145(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=248(x), r11=19(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 6
LDI r1, 52
LDI r2, 485
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 145
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 248
LDI r11, 19
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
