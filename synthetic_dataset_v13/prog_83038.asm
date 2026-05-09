; DESCRIPTION: Composite: Renders a purple line between points (62, 181) and (191, 98) then Places a magenta dot at position (19, 15).
; PLAN: r0=62(x1), r1=181(y1), r2=191(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=15(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 62
LDI r1, 181
LDI r2, 191
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 15
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
