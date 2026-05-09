; DESCRIPTION: Places a blue line segment connecting (371, 195) to (162, 38).
; PLAN: r0=371(x1), r1=195(y1), r2=162(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 195
LDI r2, 162
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
