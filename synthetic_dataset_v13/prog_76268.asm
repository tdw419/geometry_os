; DESCRIPTION: Places a magenta line segment connecting (149, 185) to (74, 141).
; PLAN: r0=149(x1), r1=185(y1), r2=74(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 185
LDI r2, 74
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
