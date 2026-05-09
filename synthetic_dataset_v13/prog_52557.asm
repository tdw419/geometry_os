; DESCRIPTION: Composite: Places a black dot at position (66, 243) then Places a blue circle of radius 63 at center (249, 157) then Places a purple line segment connecting (238, 124) to (374, 164).
; PLAN: r0=66(x), r1=243(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=157(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=238(x1), r11=124(y1), r12=374(x2), r13=164(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 243
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 249
LDI r6, 157
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 238
LDI r11, 124
LDI r12, 374
LDI r13, 164
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
