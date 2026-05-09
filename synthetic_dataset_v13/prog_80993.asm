; DESCRIPTION: Places a blue line segment connecting (345, 190) to (148, 164).
; PLAN: r0=345(x1), r1=190(y1), r2=148(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 190
LDI r2, 148
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
