; DESCRIPTION: Composite: Places a red dot at position (486, 5) then Draws a yellow line from (484, 14) to (305, 232) then Creates a yellow circular shape at (182, 53) with radius 13.
; PLAN: r0=486(x), r1=5(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=484(x1), r6=14(y1), r7=305(x2), r8=232(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=53(y), r12=13(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 486
LDI r1, 5
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 484
LDI r6, 14
LDI r7, 305
LDI r8, 232
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 53
LDI r12, 13
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
