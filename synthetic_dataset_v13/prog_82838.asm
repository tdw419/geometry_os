; DESCRIPTION: Places a magenta line segment connecting (153, 179) to (222, 243).
; PLAN: r0=153(x1), r1=179(y1), r2=222(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 179
LDI r2, 222
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
