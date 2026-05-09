; DESCRIPTION: Composite: Renders a red line between points (129, 52) and (5, 22) then Places a magenta dot at position (427, 148).
; PLAN: r0=129(x1), r1=52(y1), r2=5(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=148(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 129
LDI r1, 52
LDI r2, 5
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 148
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
