; DESCRIPTION: Places a magenta line segment connecting (87, 1) to (185, 108).
; PLAN: r0=87(x1), r1=1(y1), r2=185(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 1
LDI r2, 185
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
