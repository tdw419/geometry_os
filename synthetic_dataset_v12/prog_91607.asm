; DESCRIPTION: Places a black line segment connecting (377, 116) to (145, 138).
; PLAN: r0=377(x1), r1=116(y1), r2=145(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 116
LDI r2, 145
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
