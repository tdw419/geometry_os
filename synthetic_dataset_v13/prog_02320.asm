; DESCRIPTION: Places a blue line segment connecting (305, 211) to (200, 108).
; PLAN: r0=305(x1), r1=211(y1), r2=200(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 211
LDI r2, 200
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
