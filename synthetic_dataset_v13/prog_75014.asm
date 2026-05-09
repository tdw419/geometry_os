; DESCRIPTION: Composite: Creates a purple circular shape at (190, 81) with radius 19 then Places a blue dot at position (261, 91) then Draws a red line from (404, 153) to (396, 11).
; PLAN: r0=190(x), r1=81(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=91(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=404(x1), r11=153(y1), r12=396(x2), r13=11(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 81
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 91
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 404
LDI r11, 153
LDI r12, 396
LDI r13, 11
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
