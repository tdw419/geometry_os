; DESCRIPTION: Places a blue line segment connecting (28, 28) to (371, 231).
; PLAN: r0=28(x1), r1=28(y1), r2=371(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 28
LDI r2, 371
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
