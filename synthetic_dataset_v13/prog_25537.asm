; DESCRIPTION: Places a black line segment connecting (349, 196) to (143, 129).
; PLAN: r0=349(x1), r1=196(y1), r2=143(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 196
LDI r2, 143
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
