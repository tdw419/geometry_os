; DESCRIPTION: Places a purple line segment connecting (134, 146) to (420, 169).
; PLAN: r0=134(x1), r1=146(y1), r2=420(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 146
LDI r2, 420
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
