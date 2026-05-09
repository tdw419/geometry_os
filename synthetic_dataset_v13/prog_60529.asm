; DESCRIPTION: Composite: Renders a yellow line between points (4, 26) and (505, 233) then Sets a single black pixel at (135, 206).
; PLAN: r0=4(x1), r1=26(y1), r2=505(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=206(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 4
LDI r1, 26
LDI r2, 505
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 206
LDI r7, 0x000000
PSET r5, r6, r7
HALT
