; DESCRIPTION: Composite: Places a red line segment connecting (414, 80) to (63, 133) then Sets a single red pixel at (337, 170).
; PLAN: r0=414(x1), r1=80(y1), r2=63(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=170(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 80
LDI r2, 63
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 170
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
