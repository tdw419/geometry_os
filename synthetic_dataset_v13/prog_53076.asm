; DESCRIPTION: Renders a purple line between points (202, 225) and (432, 161).
; PLAN: r0=202(x1), r1=225(y1), r2=432(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 225
LDI r2, 432
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
