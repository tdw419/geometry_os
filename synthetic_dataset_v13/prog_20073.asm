; DESCRIPTION: Places a green line segment connecting (55, 226) to (321, 232).
; PLAN: r0=55(x1), r1=226(y1), r2=321(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 226
LDI r2, 321
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
