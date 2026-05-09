; DESCRIPTION: Composite: Draws a green line from (401, 118) to (499, 76) then Sets a single black pixel at (449, 67) then Creates a blue circular shape at (299, 48) with radius 47.
; PLAN: r0=401(x1), r1=118(y1), r2=499(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=67(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=299(x), r11=48(y), r12=47(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 401
LDI r1, 118
LDI r2, 499
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 67
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 299
LDI r11, 48
LDI r12, 47
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
