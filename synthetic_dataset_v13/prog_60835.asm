; DESCRIPTION: Places a magenta line segment connecting (84, 201) to (295, 248).
; PLAN: r0=84(x1), r1=201(y1), r2=295(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 201
LDI r2, 295
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
