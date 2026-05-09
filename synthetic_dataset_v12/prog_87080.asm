; DESCRIPTION: Places a blue line segment connecting (407, 202) to (361, 6).
; PLAN: r0=407(x1), r1=202(y1), r2=361(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 202
LDI r2, 361
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
