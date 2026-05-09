; DESCRIPTION: Renders a green line between points (200, 114) and (432, 177).
; PLAN: r0=200(x1), r1=114(y1), r2=432(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 114
LDI r2, 432
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
