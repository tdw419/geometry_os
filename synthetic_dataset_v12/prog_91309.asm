; DESCRIPTION: Places a magenta line segment connecting (55, 89) to (488, 117).
; PLAN: r0=55(x1), r1=89(y1), r2=488(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 89
LDI r2, 488
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
