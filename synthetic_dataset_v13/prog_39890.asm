; DESCRIPTION: Composite: Places a green dot at position (487, 186) then Renders a black line between points (496, 50) and (221, 145).
; PLAN: r0=487(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=496(x1), r6=50(y1), r7=221(x2), r8=145(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 487
LDI r1, 186
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 496
LDI r6, 50
LDI r7, 221
LDI r8, 145
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
