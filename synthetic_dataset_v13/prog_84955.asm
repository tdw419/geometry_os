; DESCRIPTION: Renders a blue line between points (138, 58) and (218, 179).
; PLAN: r0=138(x1), r1=58(y1), r2=218(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 58
LDI r2, 218
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
