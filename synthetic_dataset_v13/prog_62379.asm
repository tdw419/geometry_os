; DESCRIPTION: Composite: Renders a magenta line between points (411, 99) and (44, 70) then Sets a single yellow pixel at (161, 217).
; PLAN: r0=411(x1), r1=99(y1), r2=44(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=217(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 411
LDI r1, 99
LDI r2, 44
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 217
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
