; DESCRIPTION: Places a blue line segment connecting (246, 142) to (223, 237).
; PLAN: r0=246(x1), r1=142(y1), r2=223(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 142
LDI r2, 223
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
