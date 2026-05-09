; DESCRIPTION: Places a purple line segment connecting (387, 175) to (110, 103).
; PLAN: r0=387(x1), r1=175(y1), r2=110(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 175
LDI r2, 110
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
