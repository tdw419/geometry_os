; DESCRIPTION: Composite: Places a white dot at position (407, 134) then Renders a purple disk with center (291, 219) and radius 27 then Renders a red line between points (355, 24) and (485, 47).
; PLAN: r0=407(x), r1=134(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=219(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=355(x1), r11=24(y1), r12=485(x2), r13=47(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 134
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 291
LDI r6, 219
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 355
LDI r11, 24
LDI r12, 485
LDI r13, 47
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
