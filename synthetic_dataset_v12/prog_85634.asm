; DESCRIPTION: Renders a purple line between points (247, 51) and (329, 156).
; PLAN: r0=247(x1), r1=51(y1), r2=329(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 51
LDI r2, 329
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
