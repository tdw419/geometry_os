; DESCRIPTION: Places a blue line segment connecting (497, 131) to (123, 42).
; PLAN: r0=497(x1), r1=131(y1), r2=123(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 131
LDI r2, 123
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
