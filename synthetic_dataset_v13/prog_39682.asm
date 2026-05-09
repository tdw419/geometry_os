; DESCRIPTION: Places a blue line segment connecting (45, 73) to (87, 162).
; PLAN: r0=45(x1), r1=73(y1), r2=87(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 73
LDI r2, 87
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
