; DESCRIPTION: Renders a purple line between points (502, 6) and (311, 4).
; PLAN: r0=502(x1), r1=6(y1), r2=311(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 6
LDI r2, 311
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
