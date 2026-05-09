; DESCRIPTION: Places a blue line segment connecting (48, 74) to (31, 223).
; PLAN: r0=48(x1), r1=74(y1), r2=31(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 74
LDI r2, 31
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
