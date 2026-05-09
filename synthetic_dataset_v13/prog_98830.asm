; DESCRIPTION: Places a blue line segment connecting (11, 231) to (195, 37).
; PLAN: r0=11(x1), r1=231(y1), r2=195(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 231
LDI r2, 195
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
