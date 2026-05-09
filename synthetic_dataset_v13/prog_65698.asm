; DESCRIPTION: Places a yellow line segment connecting (195, 47) to (463, 137).
; PLAN: r0=195(x1), r1=47(y1), r2=463(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 47
LDI r2, 463
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
