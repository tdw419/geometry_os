; DESCRIPTION: Places a magenta line segment connecting (273, 152) to (218, 175).
; PLAN: r0=273(x1), r1=152(y1), r2=218(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 152
LDI r2, 218
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
