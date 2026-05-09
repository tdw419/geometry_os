; DESCRIPTION: Renders a purple line between points (365, 31) and (321, 7).
; PLAN: r0=365(x1), r1=31(y1), r2=321(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 31
LDI r2, 321
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
