; DESCRIPTION: Places a white line segment connecting (387, 53) to (322, 100).
; PLAN: r0=387(x1), r1=53(y1), r2=322(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 53
LDI r2, 322
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
