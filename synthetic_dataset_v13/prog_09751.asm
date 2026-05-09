; DESCRIPTION: Draws a cyan line from (279, 77) to (378, 201).
; PLAN: r0=279(x1), r1=77(y1), r2=378(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 77
LDI r2, 378
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
