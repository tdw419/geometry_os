; DESCRIPTION: Places a green line segment connecting (262, 241) to (132, 203).
; PLAN: r0=262(x1), r1=241(y1), r2=132(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 241
LDI r2, 132
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
