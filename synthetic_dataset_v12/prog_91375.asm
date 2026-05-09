; DESCRIPTION: Places a blue line segment connecting (428, 45) to (26, 42).
; PLAN: r0=428(x1), r1=45(y1), r2=26(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 45
LDI r2, 26
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
