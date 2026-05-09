; DESCRIPTION: Composite: Places a magenta line segment connecting (215, 22) to (367, 82) then Creates a purple circular shape at (24, 51) with radius 24 then Sets a single white pixel at (312, 125).
; PLAN: r0=215(x1), r1=22(y1), r2=367(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=51(y), r7=24(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=312(x), r11=125(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 215
LDI r1, 22
LDI r2, 367
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 51
LDI r7, 24
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 312
LDI r11, 125
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
