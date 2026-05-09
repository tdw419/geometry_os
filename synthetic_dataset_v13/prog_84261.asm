; DESCRIPTION: Places a green line segment connecting (387, 175) to (490, 18).
; PLAN: r0=387(x1), r1=175(y1), r2=490(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 175
LDI r2, 490
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
