; DESCRIPTION: Renders a purple line between points (394, 76) and (301, 51).
; PLAN: r0=394(x1), r1=76(y1), r2=301(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 76
LDI r2, 301
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
