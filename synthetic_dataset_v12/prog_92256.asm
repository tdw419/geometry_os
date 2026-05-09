; DESCRIPTION: Composite: Renders a purple line between points (69, 164) and (56, 48) then Creates a magenta circular shape at (409, 105) with radius 60 then Sets a single black pixel at (387, 22).
; PLAN: r0=69(x1), r1=164(y1), r2=56(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=105(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=387(x), r11=22(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 164
LDI r2, 56
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 105
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 387
LDI r11, 22
LDI r12, 0x000000
PSET r10, r11, r12
HALT
