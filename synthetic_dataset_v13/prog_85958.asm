; DESCRIPTION: Renders a blue line between points (133, 147) and (445, 67).
; PLAN: r0=133(x1), r1=147(y1), r2=445(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 147
LDI r2, 445
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
