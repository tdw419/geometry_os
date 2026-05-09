; DESCRIPTION: Places a magenta line segment connecting (0, 51) to (30, 240).
; PLAN: r0=0(x1), r1=51(y1), r2=30(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 51
LDI r2, 30
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
