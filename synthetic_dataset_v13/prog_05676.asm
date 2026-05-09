; DESCRIPTION: Places a blue line segment connecting (263, 162) to (69, 26).
; PLAN: r0=263(x1), r1=162(y1), r2=69(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 162
LDI r2, 69
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
