; DESCRIPTION: Places a magenta line segment connecting (145, 210) to (95, 96).
; PLAN: r0=145(x1), r1=210(y1), r2=95(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 210
LDI r2, 95
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
