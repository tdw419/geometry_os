; DESCRIPTION: Places a blue line segment connecting (151, 73) to (4, 169).
; PLAN: r0=151(x1), r1=73(y1), r2=4(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 73
LDI r2, 4
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
