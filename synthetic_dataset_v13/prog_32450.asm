; DESCRIPTION: Places a black line segment connecting (446, 131) to (23, 19).
; PLAN: r0=446(x1), r1=131(y1), r2=23(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 131
LDI r2, 23
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
