; DESCRIPTION: Composite: Renders a green line between points (187, 132) and (247, 200) then Sets a single blue pixel at (291, 241).
; PLAN: r0=187(x1), r1=132(y1), r2=247(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=241(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 187
LDI r1, 132
LDI r2, 247
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 241
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
