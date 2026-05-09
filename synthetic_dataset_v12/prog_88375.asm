; DESCRIPTION: Composite: Places a purple dot at position (260, 135) then Creates a purple circular shape at (407, 190) with radius 38 then Draws a green line from (88, 51) to (330, 18).
; PLAN: r0=260(x), r1=135(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=190(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=88(x1), r11=51(y1), r12=330(x2), r13=18(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 135
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 190
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 88
LDI r11, 51
LDI r12, 330
LDI r13, 18
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
