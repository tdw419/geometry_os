; DESCRIPTION: Places a magenta line segment connecting (280, 229) to (311, 231).
; PLAN: r0=280(x1), r1=229(y1), r2=311(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 229
LDI r2, 311
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
