; DESCRIPTION: Places a white line segment connecting (387, 11) to (385, 191).
; PLAN: r0=387(x1), r1=11(y1), r2=385(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 11
LDI r2, 385
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
