; DESCRIPTION: Places a green line segment connecting (110, 3) to (262, 1).
; PLAN: r0=110(x1), r1=3(y1), r2=262(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 3
LDI r2, 262
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
