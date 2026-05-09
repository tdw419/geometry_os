; DESCRIPTION: Composite: Renders a red line between points (441, 13) and (222, 207) then Places a cyan dot at position (159, 21).
; PLAN: r0=441(x1), r1=13(y1), r2=222(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=21(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 441
LDI r1, 13
LDI r2, 222
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 21
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
