; DESCRIPTION: Composite: Places a yellow line segment connecting (10, 52) to (25, 100) then Sets a single magenta pixel at (423, 55).
; PLAN: r0=10(x1), r1=52(y1), r2=25(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=55(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 10
LDI r1, 52
LDI r2, 25
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 55
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
