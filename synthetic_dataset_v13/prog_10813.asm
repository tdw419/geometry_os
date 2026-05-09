; DESCRIPTION: Places a yellow line segment connecting (503, 189) to (3, 98).
; PLAN: r0=503(x1), r1=189(y1), r2=3(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 189
LDI r2, 3
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
