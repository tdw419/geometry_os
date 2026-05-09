; DESCRIPTION: Composite: Creates a black circular shape at (283, 183) with radius 55 then Places a black dot at position (428, 138) then Places a magenta line segment connecting (366, 50) to (358, 28).
; PLAN: r0=283(x), r1=183(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=138(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=366(x1), r11=50(y1), r12=358(x2), r13=28(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 183
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 138
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 366
LDI r11, 50
LDI r12, 358
LDI r13, 28
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
