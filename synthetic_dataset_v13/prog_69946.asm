; DESCRIPTION: Composite: Creates a purple circular shape at (362, 74) with radius 36 then Places a red dot at position (148, 97) then Places a orange line segment connecting (355, 65) to (461, 212).
; PLAN: r0=362(x), r1=74(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x), r6=97(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=355(x1), r11=65(y1), r12=461(x2), r13=212(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 74
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 97
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 355
LDI r11, 65
LDI r12, 461
LDI r13, 212
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
