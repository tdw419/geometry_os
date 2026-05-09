; DESCRIPTION: Places a yellow line segment connecting (218, 131) to (385, 81).
; PLAN: r0=218(x1), r1=131(y1), r2=385(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 131
LDI r2, 385
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
