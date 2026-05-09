; DESCRIPTION: Places a green line segment connecting (203, 46) to (22, 93).
; PLAN: r0=203(x1), r1=46(y1), r2=22(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 46
LDI r2, 22
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
