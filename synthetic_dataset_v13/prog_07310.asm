; DESCRIPTION: Places a magenta line segment connecting (469, 131) to (389, 166).
; PLAN: r0=469(x1), r1=131(y1), r2=389(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 131
LDI r2, 389
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
