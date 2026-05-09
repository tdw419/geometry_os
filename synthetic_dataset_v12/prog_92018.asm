; DESCRIPTION: Places a magenta line segment connecting (308, 109) to (279, 197).
; PLAN: r0=308(x1), r1=109(y1), r2=279(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 109
LDI r2, 279
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
