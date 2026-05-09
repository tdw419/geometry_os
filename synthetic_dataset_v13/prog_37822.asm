; DESCRIPTION: Composite: Sets a single orange pixel at (387, 39) then Renders a purple line between points (119, 137) and (106, 221) then Creates a white circular shape at (327, 60) with radius 17.
; PLAN: r0=387(x), r1=39(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=119(x1), r6=137(y1), r7=106(x2), r8=221(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=327(x), r11=60(y), r12=17(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 387
LDI r1, 39
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 119
LDI r6, 137
LDI r7, 106
LDI r8, 221
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 60
LDI r12, 17
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
