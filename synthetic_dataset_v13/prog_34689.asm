; DESCRIPTION: Places a white line segment connecting (181, 95) to (142, 192).
; PLAN: r0=181(x1), r1=95(y1), r2=142(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 95
LDI r2, 142
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
