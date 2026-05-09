; DESCRIPTION: Composite: Sets a single red pixel at (179, 82) then Creates a black circular shape at (81, 71) with radius 50 then Draws a black line from (489, 26) to (197, 5).
; PLAN: r0=179(x), r1=82(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=71(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=489(x1), r11=26(y1), r12=197(x2), r13=5(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 82
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 81
LDI r6, 71
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 489
LDI r11, 26
LDI r12, 197
LDI r13, 5
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
