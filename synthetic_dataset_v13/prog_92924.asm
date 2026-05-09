; DESCRIPTION: Composite: Renders a green line between points (226, 155) and (258, 21) then Places a white dot at position (102, 158).
; PLAN: r0=226(x1), r1=155(y1), r2=258(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=158(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 226
LDI r1, 155
LDI r2, 258
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 158
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
