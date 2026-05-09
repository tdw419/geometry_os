; DESCRIPTION: Places a blue line segment connecting (131, 126) to (221, 55).
; PLAN: r0=131(x1), r1=126(y1), r2=221(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 126
LDI r2, 221
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
