; DESCRIPTION: Places a black line segment connecting (437, 199) to (387, 36).
; PLAN: r0=437(x1), r1=199(y1), r2=387(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 199
LDI r2, 387
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
