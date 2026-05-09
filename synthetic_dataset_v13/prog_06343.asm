; DESCRIPTION: Places a magenta line segment connecting (47, 193) to (120, 44).
; PLAN: r0=47(x1), r1=193(y1), r2=120(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 193
LDI r2, 120
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
