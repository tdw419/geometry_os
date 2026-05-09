; DESCRIPTION: Places a magenta line segment connecting (270, 150) to (115, 57).
; PLAN: r0=270(x1), r1=150(y1), r2=115(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 150
LDI r2, 115
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
