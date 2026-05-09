; DESCRIPTION: Places a magenta line segment connecting (37, 176) to (179, 57).
; PLAN: r0=37(x1), r1=176(y1), r2=179(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 176
LDI r2, 179
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
