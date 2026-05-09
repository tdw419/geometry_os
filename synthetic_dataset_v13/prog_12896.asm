; DESCRIPTION: Composite: Creates a red circular shape at (500, 212) with radius 11 then Places a red dot at position (457, 194) then Places a orange line segment connecting (58, 45) to (5, 87).
; PLAN: r0=500(x), r1=212(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=194(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=58(x1), r11=45(y1), r12=5(x2), r13=87(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 500
LDI r1, 212
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 194
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 58
LDI r11, 45
LDI r12, 5
LDI r13, 87
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
