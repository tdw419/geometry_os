; DESCRIPTION: Composite: Renders a blue line between points (82, 76) and (26, 187) then Places a blue dot at position (433, 131).
; PLAN: r0=82(x1), r1=76(y1), r2=26(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=131(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 82
LDI r1, 76
LDI r2, 26
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 131
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
