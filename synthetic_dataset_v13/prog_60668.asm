; DESCRIPTION: Composite: Renders a magenta line between points (43, 158) and (484, 134) then Places a green dot at position (16, 119).
; PLAN: r0=43(x1), r1=158(y1), r2=484(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=16(x), r6=119(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 43
LDI r1, 158
LDI r2, 484
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 119
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
