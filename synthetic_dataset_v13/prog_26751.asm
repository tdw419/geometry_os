; DESCRIPTION: Composite: Places a orange dot at position (275, 242) then Places a purple circle of radius 45 at center (197, 54) then Places a purple line segment connecting (119, 39) to (155, 34).
; PLAN: r0=275(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=54(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=119(x1), r11=39(y1), r12=155(x2), r13=34(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 242
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 197
LDI r6, 54
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 119
LDI r11, 39
LDI r12, 155
LDI r13, 34
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
