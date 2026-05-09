; DESCRIPTION: Places a blue line segment connecting (238, 16) to (68, 231).
; PLAN: r0=238(x1), r1=16(y1), r2=68(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 16
LDI r2, 68
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
