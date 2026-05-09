; DESCRIPTION: Composite: Sets a single magenta pixel at (178, 185) then Creates a yellow circular shape at (250, 100) with radius 39 then Places a red line segment connecting (312, 254) to (456, 79).
; PLAN: r0=178(x), r1=185(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=250(x), r6=100(y), r7=39(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=312(x1), r11=254(y1), r12=456(x2), r13=79(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 185
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 250
LDI r6, 100
LDI r7, 39
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 312
LDI r11, 254
LDI r12, 456
LDI r13, 79
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
