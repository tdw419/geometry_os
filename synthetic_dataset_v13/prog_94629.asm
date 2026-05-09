; DESCRIPTION: Places a magenta line segment connecting (57, 60) to (324, 14).
; PLAN: r0=57(x1), r1=60(y1), r2=324(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 60
LDI r2, 324
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
