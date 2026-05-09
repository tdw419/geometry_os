; DESCRIPTION: Renders a blue line between points (297, 58) and (417, 229).
; PLAN: r0=297(x1), r1=58(y1), r2=417(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 58
LDI r2, 417
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
