; DESCRIPTION: Composite: Renders a purple line between points (109, 140) and (407, 53) then Places a green dot at position (442, 112).
; PLAN: r0=109(x1), r1=140(y1), r2=407(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=112(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 109
LDI r1, 140
LDI r2, 407
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 112
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
