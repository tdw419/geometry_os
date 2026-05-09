; DESCRIPTION: Composite: Renders a cyan line between points (381, 18) and (360, 188) then Places a yellow dot at position (478, 155).
; PLAN: r0=381(x1), r1=18(y1), r2=360(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=478(x), r6=155(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 381
LDI r1, 18
LDI r2, 360
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 155
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
