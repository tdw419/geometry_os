; DESCRIPTION: Places a magenta line segment connecting (305, 147) to (466, 54).
; PLAN: r0=305(x1), r1=147(y1), r2=466(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 147
LDI r2, 466
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
