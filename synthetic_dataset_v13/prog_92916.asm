; DESCRIPTION: Places a green line segment connecting (447, 227) to (243, 138).
; PLAN: r0=447(x1), r1=227(y1), r2=243(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 227
LDI r2, 243
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
