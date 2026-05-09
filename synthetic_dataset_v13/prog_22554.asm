; DESCRIPTION: Composite: Renders a yellow line between points (378, 194) and (424, 55) then Places a blue dot at position (430, 98).
; PLAN: r0=378(x1), r1=194(y1), r2=424(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=98(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 378
LDI r1, 194
LDI r2, 424
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 98
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
