; DESCRIPTION: Places a blue line segment connecting (305, 237) to (343, 218).
; PLAN: r0=305(x1), r1=237(y1), r2=343(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 237
LDI r2, 343
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
