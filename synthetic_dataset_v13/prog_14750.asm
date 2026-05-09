; DESCRIPTION: Places a cyan line segment connecting (312, 137) to (133, 148).
; PLAN: r0=312(x1), r1=137(y1), r2=133(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 137
LDI r2, 133
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
