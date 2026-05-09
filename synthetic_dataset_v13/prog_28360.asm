; DESCRIPTION: Places a green line segment connecting (133, 126) to (70, 211).
; PLAN: r0=133(x1), r1=126(y1), r2=70(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 126
LDI r2, 70
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
