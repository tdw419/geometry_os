; DESCRIPTION: Composite: Places a purple line segment connecting (81, 158) to (36, 63) then Draws a white circle centered at (385, 112) with radius 22 then Places a yellow dot at position (383, 196).
; PLAN: r0=81(x1), r1=158(y1), r2=36(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=112(y), r7=22(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=383(x), r11=196(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 158
LDI r2, 36
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 112
LDI r7, 22
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 383
LDI r11, 196
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
