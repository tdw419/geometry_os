; DESCRIPTION: Composite: Places a black line segment connecting (142, 104) to (367, 47) then Sets a single magenta pixel at (148, 63).
; PLAN: r0=142(x1), r1=104(y1), r2=367(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=63(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 142
LDI r1, 104
LDI r2, 367
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 63
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
