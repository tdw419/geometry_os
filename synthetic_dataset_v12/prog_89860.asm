; DESCRIPTION: Places a green line segment connecting (115, 61) to (219, 220).
; PLAN: r0=115(x1), r1=61(y1), r2=219(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 61
LDI r2, 219
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
