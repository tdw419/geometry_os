; DESCRIPTION: Composite: Renders a black line between points (382, 173) and (372, 185) then Creates a blue circular shape at (271, 49) with radius 47 then Sets a single magenta pixel at (191, 118).
; PLAN: r0=382(x1), r1=173(y1), r2=372(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=49(y), r7=47(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=191(x), r11=118(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 382
LDI r1, 173
LDI r2, 372
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 49
LDI r7, 47
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 191
LDI r11, 118
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
