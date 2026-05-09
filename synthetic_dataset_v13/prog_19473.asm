; DESCRIPTION: Renders a purple line between points (508, 227) and (354, 107).
; PLAN: r0=508(x1), r1=227(y1), r2=354(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 227
LDI r2, 354
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
