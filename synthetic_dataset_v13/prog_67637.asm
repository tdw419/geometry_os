; DESCRIPTION: Places a magenta line segment connecting (388, 159) to (392, 148).
; PLAN: r0=388(x1), r1=159(y1), r2=392(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 159
LDI r2, 392
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
