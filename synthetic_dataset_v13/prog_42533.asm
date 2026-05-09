; DESCRIPTION: Composite: Places a purple line segment connecting (65, 52) to (403, 126) then Sets a single purple pixel at (115, 18).
; PLAN: r0=65(x1), r1=52(y1), r2=403(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=18(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 65
LDI r1, 52
LDI r2, 403
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 18
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
