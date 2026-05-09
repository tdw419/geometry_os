; DESCRIPTION: Places a red line segment connecting (86, 63) to (147, 87).
; PLAN: r0=86(x1), r1=63(y1), r2=147(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 63
LDI r2, 147
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
