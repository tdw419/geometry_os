; DESCRIPTION: Places a yellow line segment connecting (458, 196) to (160, 131).
; PLAN: r0=458(x1), r1=196(y1), r2=160(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 196
LDI r2, 160
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
