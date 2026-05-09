; DESCRIPTION: Renders a magenta line between points (222, 131) and (418, 218).
; PLAN: r0=222(x1), r1=131(y1), r2=418(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 131
LDI r2, 418
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
