; DESCRIPTION: Places a green line segment connecting (254, 233) to (77, 133).
; PLAN: r0=254(x1), r1=233(y1), r2=77(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 233
LDI r2, 77
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
