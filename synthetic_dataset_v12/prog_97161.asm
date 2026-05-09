; DESCRIPTION: Places a magenta line segment connecting (468, 193) to (249, 64).
; PLAN: r0=468(x1), r1=193(y1), r2=249(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 193
LDI r2, 249
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
