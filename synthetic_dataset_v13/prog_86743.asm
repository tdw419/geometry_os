; DESCRIPTION: Places a magenta line segment connecting (191, 131) to (486, 239).
; PLAN: r0=191(x1), r1=131(y1), r2=486(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 131
LDI r2, 486
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
