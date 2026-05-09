; DESCRIPTION: Places a magenta line segment connecting (302, 193) to (262, 231).
; PLAN: r0=302(x1), r1=193(y1), r2=262(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 193
LDI r2, 262
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
