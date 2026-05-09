; DESCRIPTION: Places a magenta line segment connecting (389, 29) to (498, 6).
; PLAN: r0=389(x1), r1=29(y1), r2=498(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 29
LDI r2, 498
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
