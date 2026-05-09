; DESCRIPTION: Renders a purple line between points (441, 20) and (365, 221).
; PLAN: r0=441(x1), r1=20(y1), r2=365(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 20
LDI r2, 365
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
