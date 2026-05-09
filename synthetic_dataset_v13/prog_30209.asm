; DESCRIPTION: Places a green line segment connecting (80, 86) to (117, 212).
; PLAN: r0=80(x1), r1=86(y1), r2=117(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 86
LDI r2, 117
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
