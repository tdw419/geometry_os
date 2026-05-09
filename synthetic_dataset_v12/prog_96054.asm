; DESCRIPTION: Places a magenta line segment connecting (161, 155) to (95, 231).
; PLAN: r0=161(x1), r1=155(y1), r2=95(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 155
LDI r2, 95
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
