; DESCRIPTION: Composite: Renders a magenta line between points (482, 155) and (481, 30) then Sets a single blue pixel at (312, 254).
; PLAN: r0=482(x1), r1=155(y1), r2=481(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=254(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 482
LDI r1, 155
LDI r2, 481
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 254
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
