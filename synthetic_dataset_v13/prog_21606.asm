; DESCRIPTION: Composite: Places a yellow circle of radius 41 at center (449, 152) then Sets a single purple pixel at (232, 84) then Places a yellow line segment connecting (43, 34) to (167, 167).
; PLAN: r0=449(x), r1=152(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x), r6=84(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=43(x1), r11=34(y1), r12=167(x2), r13=167(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 152
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 84
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 43
LDI r11, 34
LDI r12, 167
LDI r13, 167
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
