; DESCRIPTION: Composite: Sets a single red pixel at (216, 23) then Draws a yellow line from (454, 217) to (45, 191).
; PLAN: r0=216(x), r1=23(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=454(x1), r6=217(y1), r7=45(x2), r8=191(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 23
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 454
LDI r6, 217
LDI r7, 45
LDI r8, 191
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
