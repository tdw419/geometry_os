; DESCRIPTION: Places a magenta line segment connecting (16, 147) to (39, 6).
; PLAN: r0=16(x1), r1=147(y1), r2=39(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 147
LDI r2, 39
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
