; DESCRIPTION: Composite: Renders a magenta line between points (184, 170) and (89, 70) then Places a red dot at position (89, 204).
; PLAN: r0=184(x1), r1=170(y1), r2=89(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=89(x), r6=204(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 184
LDI r1, 170
LDI r2, 89
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 204
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
