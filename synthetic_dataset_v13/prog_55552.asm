; DESCRIPTION: Places a purple line segment connecting (408, 223) to (18, 129).
; PLAN: r0=408(x1), r1=223(y1), r2=18(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 223
LDI r2, 18
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
