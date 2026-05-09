; DESCRIPTION: Composite: Draws a yellow circle centered at (363, 145) with radius 32 then Renders a purple line between points (12, 170) and (94, 189) then Sets a single white pixel at (26, 113).
; PLAN: r0=363(x), r1=145(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x1), r6=170(y1), r7=94(x2), r8=189(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=26(x), r11=113(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 145
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 170
LDI r7, 94
LDI r8, 189
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 113
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
