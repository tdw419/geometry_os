; DESCRIPTION: Composite: Draws a yellow line from (83, 76) to (369, 123) then Places a green dot at position (467, 31).
; PLAN: r0=83(x1), r1=76(y1), r2=369(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=31(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 76
LDI r2, 369
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 31
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
