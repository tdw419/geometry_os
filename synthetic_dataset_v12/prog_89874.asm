; DESCRIPTION: Composite: Places a green line segment connecting (5, 59) to (351, 141) then Places a purple dot at position (208, 106).
; PLAN: r0=5(x1), r1=59(y1), r2=351(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=106(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 5
LDI r1, 59
LDI r2, 351
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 106
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
