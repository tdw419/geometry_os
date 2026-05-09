; DESCRIPTION: Places a black line segment connecting (133, 121) to (264, 33).
; PLAN: r0=133(x1), r1=121(y1), r2=264(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 121
LDI r2, 264
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
