; DESCRIPTION: Places a yellow line segment connecting (87, 112) to (61, 161).
; PLAN: r0=87(x1), r1=112(y1), r2=61(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 112
LDI r2, 61
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
