; DESCRIPTION: Places a magenta line segment connecting (478, 79) to (442, 168).
; PLAN: r0=478(x1), r1=79(y1), r2=442(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 79
LDI r2, 442
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
