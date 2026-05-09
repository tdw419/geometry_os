; DESCRIPTION: Places a black line segment connecting (131, 57) to (59, 19).
; PLAN: r0=131(x1), r1=57(y1), r2=59(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 57
LDI r2, 59
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
