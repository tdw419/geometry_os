; DESCRIPTION: Draws a green line from (77, 0) to (289, 201).
; PLAN: r0=77(x1), r1=0(y1), r2=289(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 0
LDI r2, 289
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
