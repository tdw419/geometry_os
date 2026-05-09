; DESCRIPTION: Places a white line segment connecting (387, 130) to (431, 217).
; PLAN: r0=387(x1), r1=130(y1), r2=431(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 130
LDI r2, 431
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
