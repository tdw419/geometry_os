; DESCRIPTION: Composite: Places a purple circle of radius 10 at center (25, 159) then Places a white dot at position (116, 70) then Draws a yellow line from (55, 71) to (357, 202).
; PLAN: r0=25(x), r1=159(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x), r6=70(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=55(x1), r11=71(y1), r12=357(x2), r13=202(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 159
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 70
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 55
LDI r11, 71
LDI r12, 357
LDI r13, 202
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
