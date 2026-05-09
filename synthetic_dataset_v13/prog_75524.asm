; DESCRIPTION: Places a black line segment connecting (459, 172) to (77, 57).
; PLAN: r0=459(x1), r1=172(y1), r2=77(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 172
LDI r2, 77
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
