; DESCRIPTION: Composite: Places a yellow line segment connecting (168, 243) to (377, 118) then Places a purple dot at position (399, 137).
; PLAN: r0=168(x1), r1=243(y1), r2=377(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=137(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 168
LDI r1, 243
LDI r2, 377
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 137
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
