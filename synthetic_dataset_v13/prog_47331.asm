; DESCRIPTION: Composite: Places a purple circle of radius 23 at center (288, 94) then Places a blue dot at position (193, 209) then Places a magenta line segment connecting (170, 101) to (494, 36).
; PLAN: r0=288(x), r1=94(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=209(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=170(x1), r11=101(y1), r12=494(x2), r13=36(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 94
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 209
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 170
LDI r11, 101
LDI r12, 494
LDI r13, 36
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
