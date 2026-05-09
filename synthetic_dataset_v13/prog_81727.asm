; DESCRIPTION: Composite: Renders a green line between points (121, 126) and (361, 59) then Places a blue dot at position (208, 65).
; PLAN: r0=121(x1), r1=126(y1), r2=361(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=65(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 121
LDI r1, 126
LDI r2, 361
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 65
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
