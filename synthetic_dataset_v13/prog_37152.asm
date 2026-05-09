; DESCRIPTION: Places a blue line segment connecting (299, 7) to (218, 193).
; PLAN: r0=299(x1), r1=7(y1), r2=218(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 7
LDI r2, 218
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
