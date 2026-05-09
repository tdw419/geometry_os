; DESCRIPTION: Composite: Places a black dot at position (266, 221) then Places a purple circle of radius 34 at center (233, 105) then Draws a orange line from (279, 5) to (165, 164).
; PLAN: r0=266(x), r1=221(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=233(x), r6=105(y), r7=34(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x1), r11=5(y1), r12=165(x2), r13=164(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 221
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 233
LDI r6, 105
LDI r7, 34
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 5
LDI r12, 165
LDI r13, 164
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
