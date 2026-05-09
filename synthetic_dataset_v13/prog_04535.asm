; DESCRIPTION: Composite: Places a purple line segment connecting (141, 81) to (400, 164) then Places a yellow dot at position (250, 118).
; PLAN: r0=141(x1), r1=81(y1), r2=400(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=118(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 141
LDI r1, 81
LDI r2, 400
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 118
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
