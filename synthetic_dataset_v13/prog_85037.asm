; DESCRIPTION: Places a green line segment connecting (75, 34) to (59, 203).
; PLAN: r0=75(x1), r1=34(y1), r2=59(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 34
LDI r2, 59
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
