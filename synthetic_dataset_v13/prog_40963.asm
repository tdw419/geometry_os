; DESCRIPTION: Composite: Renders a black line between points (116, 121) and (179, 37) then Places a red dot at position (146, 177) then Creates a yellow circular shape at (213, 104) with radius 76.
; PLAN: r0=116(x1), r1=121(y1), r2=179(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=177(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=213(x), r11=104(y), r12=76(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 116
LDI r1, 121
LDI r2, 179
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 177
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 213
LDI r11, 104
LDI r12, 76
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
