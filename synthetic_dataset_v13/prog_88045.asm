; DESCRIPTION: Composite: Sets a single red pixel at (487, 139) then Draws a purple circle centered at (340, 79) with radius 79 then Renders a orange line between points (326, 145) and (315, 131).
; PLAN: r0=487(x), r1=139(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=79(y), r7=79(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=326(x1), r11=145(y1), r12=315(x2), r13=131(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 487
LDI r1, 139
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 340
LDI r6, 79
LDI r7, 79
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 326
LDI r11, 145
LDI r12, 315
LDI r13, 131
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
