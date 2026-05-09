; DESCRIPTION: Places a magenta line segment connecting (457, 47) to (7, 231).
; PLAN: r0=457(x1), r1=47(y1), r2=7(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 47
LDI r2, 7
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
