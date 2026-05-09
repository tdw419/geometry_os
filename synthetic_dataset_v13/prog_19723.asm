; DESCRIPTION: Places a black line segment connecting (153, 212) to (72, 117).
; PLAN: r0=153(x1), r1=212(y1), r2=72(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 212
LDI r2, 72
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
