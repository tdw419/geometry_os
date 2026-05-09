; DESCRIPTION: Composite: Places a yellow circle of radius 59 at center (262, 165) then Sets a single white pixel at (484, 85) then Draws a white line from (511, 253) to (459, 18).
; PLAN: r0=262(x), r1=165(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x), r6=85(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=511(x1), r11=253(y1), r12=459(x2), r13=18(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 165
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 85
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 511
LDI r11, 253
LDI r12, 459
LDI r13, 18
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
