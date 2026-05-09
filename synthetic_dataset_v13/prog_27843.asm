; DESCRIPTION: Places a blue line segment connecting (189, 196) to (325, 91).
; PLAN: r0=189(x1), r1=196(y1), r2=325(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 196
LDI r2, 325
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
