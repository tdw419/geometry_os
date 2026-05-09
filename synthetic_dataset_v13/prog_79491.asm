; DESCRIPTION: Composite: Places a purple dot at position (179, 121) then Places a magenta circle of radius 11 at center (305, 164) then Draws a purple line from (124, 155) to (347, 103).
; PLAN: r0=179(x), r1=121(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=164(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=124(x1), r11=155(y1), r12=347(x2), r13=103(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 121
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 164
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 124
LDI r11, 155
LDI r12, 347
LDI r13, 103
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
