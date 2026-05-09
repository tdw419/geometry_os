; DESCRIPTION: Places a black line segment connecting (460, 143) to (411, 129).
; PLAN: r0=460(x1), r1=143(y1), r2=411(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 143
LDI r2, 411
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
