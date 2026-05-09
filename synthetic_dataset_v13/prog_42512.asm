; DESCRIPTION: Composite: Renders a orange line between points (195, 194) and (132, 252) then Places a red dot at position (186, 97) then Places a cyan circle of radius 36 at center (122, 196).
; PLAN: r0=195(x1), r1=194(y1), r2=132(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=97(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=122(x), r11=196(y), r12=36(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 195
LDI r1, 194
LDI r2, 132
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 97
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 122
LDI r11, 196
LDI r12, 36
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
