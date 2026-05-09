; DESCRIPTION: Places a black line segment connecting (389, 116) to (437, 10).
; PLAN: r0=389(x1), r1=116(y1), r2=437(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 116
LDI r2, 437
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
