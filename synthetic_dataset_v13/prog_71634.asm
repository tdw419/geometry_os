; DESCRIPTION: Composite: Places a yellow line segment connecting (266, 40) to (63, 101) then Sets a single purple pixel at (420, 17).
; PLAN: r0=266(x1), r1=40(y1), r2=63(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=17(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 266
LDI r1, 40
LDI r2, 63
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 17
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
