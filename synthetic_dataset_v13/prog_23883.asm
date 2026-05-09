; DESCRIPTION: Places a green line segment connecting (25, 40) to (418, 226).
; PLAN: r0=25(x1), r1=40(y1), r2=418(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 40
LDI r2, 418
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
