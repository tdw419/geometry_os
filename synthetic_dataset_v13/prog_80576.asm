; DESCRIPTION: Composite: Draws a blue line from (158, 9) to (85, 14) then Places a red dot at position (66, 112).
; PLAN: r0=158(x1), r1=9(y1), r2=85(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=112(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 158
LDI r1, 9
LDI r2, 85
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 112
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
