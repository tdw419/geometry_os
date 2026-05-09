; DESCRIPTION: Places a blue line segment connecting (215, 241) to (133, 231).
; PLAN: r0=215(x1), r1=241(y1), r2=133(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 241
LDI r2, 133
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
