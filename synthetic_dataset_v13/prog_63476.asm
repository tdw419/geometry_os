; DESCRIPTION: Places a magenta line segment connecting (336, 65) to (433, 105).
; PLAN: r0=336(x1), r1=65(y1), r2=433(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 65
LDI r2, 433
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
