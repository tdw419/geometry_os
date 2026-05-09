; DESCRIPTION: Places a green line segment connecting (77, 177) to (55, 142).
; PLAN: r0=77(x1), r1=177(y1), r2=55(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 177
LDI r2, 55
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
