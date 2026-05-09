; DESCRIPTION: Composite: Sets a single magenta pixel at (72, 137) then Creates a cyan circular shape at (407, 197) with radius 39 then Renders a purple line between points (138, 43) and (65, 11).
; PLAN: r0=72(x), r1=137(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=197(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=138(x1), r11=43(y1), r12=65(x2), r13=11(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 137
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 197
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 138
LDI r11, 43
LDI r12, 65
LDI r13, 11
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
