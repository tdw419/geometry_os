; DESCRIPTION: Composite: Draws a yellow circle centered at (76, 103) with radius 51 then Sets a single blue pixel at (419, 251) then Places a white line segment connecting (473, 66) to (70, 88).
; PLAN: r0=76(x), r1=103(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x), r6=251(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=473(x1), r11=66(y1), r12=70(x2), r13=88(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 103
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 251
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 473
LDI r11, 66
LDI r12, 70
LDI r13, 88
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
