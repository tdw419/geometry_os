; DESCRIPTION: Renders a white line between points (362, 110) and (417, 51).
; PLAN: r0=362(x1), r1=110(y1), r2=417(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 110
LDI r2, 417
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
