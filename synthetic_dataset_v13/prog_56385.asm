; DESCRIPTION: Places a magenta line segment connecting (488, 0) to (145, 31).
; PLAN: r0=488(x1), r1=0(y1), r2=145(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 0
LDI r2, 145
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
