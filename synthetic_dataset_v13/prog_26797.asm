; DESCRIPTION: Places a blue line segment connecting (134, 121) to (272, 91).
; PLAN: r0=134(x1), r1=121(y1), r2=272(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 121
LDI r2, 272
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
