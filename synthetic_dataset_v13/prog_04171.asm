; DESCRIPTION: Composite: Renders a orange line between points (425, 76) and (417, 1) then Places a yellow dot at position (454, 105).
; PLAN: r0=425(x1), r1=76(y1), r2=417(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=454(x), r6=105(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 425
LDI r1, 76
LDI r2, 417
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 105
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
