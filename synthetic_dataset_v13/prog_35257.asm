; DESCRIPTION: Places a magenta line segment connecting (355, 15) to (458, 142).
; PLAN: r0=355(x1), r1=15(y1), r2=458(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 15
LDI r2, 458
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
