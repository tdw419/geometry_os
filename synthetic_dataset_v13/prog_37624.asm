; DESCRIPTION: Places a magenta line segment connecting (193, 61) to (95, 5).
; PLAN: r0=193(x1), r1=61(y1), r2=95(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 61
LDI r2, 95
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
