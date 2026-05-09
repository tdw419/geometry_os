; DESCRIPTION: Composite: Sets a single green pixel at (362, 36) then Draws a orange line from (141, 142) to (263, 162) then Creates a red circular shape at (245, 85) with radius 66.
; PLAN: r0=362(x), r1=36(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=141(x1), r6=142(y1), r7=263(x2), r8=162(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=245(x), r11=85(y), r12=66(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 362
LDI r1, 36
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 141
LDI r6, 142
LDI r7, 263
LDI r8, 162
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 85
LDI r12, 66
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
