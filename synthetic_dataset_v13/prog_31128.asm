; DESCRIPTION: Places a magenta line segment connecting (260, 186) to (56, 161).
; PLAN: r0=260(x1), r1=186(y1), r2=56(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 186
LDI r2, 56
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
