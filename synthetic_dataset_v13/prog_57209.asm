; DESCRIPTION: Composite: Renders a magenta line between points (436, 22) and (471, 224) then Sets a single yellow pixel at (216, 103).
; PLAN: r0=436(x1), r1=22(y1), r2=471(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=103(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 436
LDI r1, 22
LDI r2, 471
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 103
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
