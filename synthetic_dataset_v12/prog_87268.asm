; DESCRIPTION: Renders a blue line between points (246, 233) and (345, 214).
; PLAN: r0=246(x1), r1=233(y1), r2=345(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 233
LDI r2, 345
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
