; DESCRIPTION: Places a blue line segment connecting (16, 192) to (305, 234).
; PLAN: r0=16(x1), r1=192(y1), r2=305(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 192
LDI r2, 305
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
