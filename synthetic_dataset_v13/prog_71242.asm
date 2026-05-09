; DESCRIPTION: Composite: Places a purple line segment connecting (145, 253) to (483, 245) then Places a green dot at position (194, 146).
; PLAN: r0=145(x1), r1=253(y1), r2=483(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=146(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 145
LDI r1, 253
LDI r2, 483
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 146
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
