; DESCRIPTION: Composite: Renders a green line between points (289, 190) and (323, 187) then Places a yellow dot at position (151, 109).
; PLAN: r0=289(x1), r1=190(y1), r2=323(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=109(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 289
LDI r1, 190
LDI r2, 323
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 109
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
