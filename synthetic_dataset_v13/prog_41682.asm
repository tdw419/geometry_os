; DESCRIPTION: Places a green line segment connecting (132, 133) to (379, 208).
; PLAN: r0=132(x1), r1=133(y1), r2=379(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 133
LDI r2, 379
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
