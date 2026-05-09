; DESCRIPTION: Places a black line segment connecting (495, 82) to (133, 241).
; PLAN: r0=495(x1), r1=82(y1), r2=133(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 82
LDI r2, 133
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
