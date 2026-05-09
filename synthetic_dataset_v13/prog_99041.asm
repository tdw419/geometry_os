; DESCRIPTION: Composite: Renders a green line between points (25, 102) and (234, 189) then Places a red dot at position (324, 246).
; PLAN: r0=25(x1), r1=102(y1), r2=234(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=246(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 25
LDI r1, 102
LDI r2, 234
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 246
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
