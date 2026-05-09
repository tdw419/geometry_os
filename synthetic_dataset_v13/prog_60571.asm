; DESCRIPTION: Places a magenta line segment connecting (231, 249) to (245, 218).
; PLAN: r0=231(x1), r1=249(y1), r2=245(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 249
LDI r2, 245
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
