; DESCRIPTION: Composite: Renders a blue line between points (53, 117) and (191, 11) then Places a red dot at position (324, 248).
; PLAN: r0=53(x1), r1=117(y1), r2=191(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=248(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 53
LDI r1, 117
LDI r2, 191
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 248
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
