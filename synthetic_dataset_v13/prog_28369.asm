; DESCRIPTION: Places a blue line segment connecting (481, 218) to (98, 167).
; PLAN: r0=481(x1), r1=218(y1), r2=98(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 218
LDI r2, 98
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
