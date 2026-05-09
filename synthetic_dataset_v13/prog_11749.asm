; DESCRIPTION: Composite: Draws a green line from (97, 89) to (26, 146) then Places a blue dot at position (168, 49).
; PLAN: r0=97(x1), r1=89(y1), r2=26(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=49(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 89
LDI r2, 26
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 49
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
