; DESCRIPTION: Places a magenta line segment connecting (226, 52) to (439, 216).
; PLAN: r0=226(x1), r1=52(y1), r2=439(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 52
LDI r2, 439
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
