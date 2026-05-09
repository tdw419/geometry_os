; DESCRIPTION: Places a magenta line segment connecting (2, 153) to (131, 55).
; PLAN: r0=2(x1), r1=153(y1), r2=131(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 153
LDI r2, 131
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
