; DESCRIPTION: Places a black line segment connecting (386, 144) to (11, 133).
; PLAN: r0=386(x1), r1=144(y1), r2=11(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 144
LDI r2, 11
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
