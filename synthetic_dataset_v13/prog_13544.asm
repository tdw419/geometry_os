; DESCRIPTION: Composite: Places a magenta line segment connecting (455, 245) to (499, 76) then Sets a single magenta pixel at (368, 20).
; PLAN: r0=455(x1), r1=245(y1), r2=499(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=20(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 455
LDI r1, 245
LDI r2, 499
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 20
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
