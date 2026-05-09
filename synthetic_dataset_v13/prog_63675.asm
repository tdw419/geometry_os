; DESCRIPTION: Places a magenta line segment connecting (461, 226) to (216, 202).
; PLAN: r0=461(x1), r1=226(y1), r2=216(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 226
LDI r2, 216
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
