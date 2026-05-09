; DESCRIPTION: Composite: Places a magenta line segment connecting (123, 29) to (483, 192) then Sets a single magenta pixel at (299, 55).
; PLAN: r0=123(x1), r1=29(y1), r2=483(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=55(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 123
LDI r1, 29
LDI r2, 483
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 55
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
