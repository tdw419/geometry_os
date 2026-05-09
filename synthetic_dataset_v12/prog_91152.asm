; DESCRIPTION: Places a blue line segment connecting (487, 44) to (84, 221).
; PLAN: r0=487(x1), r1=44(y1), r2=84(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 44
LDI r2, 84
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
