; DESCRIPTION: Places a white line segment connecting (77, 22) to (387, 220).
; PLAN: r0=77(x1), r1=22(y1), r2=387(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 22
LDI r2, 387
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
