; DESCRIPTION: Composite: Places a orange line segment connecting (236, 135) to (22, 107) then Sets a single magenta pixel at (126, 15).
; PLAN: r0=236(x1), r1=135(y1), r2=22(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=15(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 236
LDI r1, 135
LDI r2, 22
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 15
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
