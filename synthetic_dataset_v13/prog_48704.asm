; DESCRIPTION: Places a red line segment connecting (1, 86) to (265, 216).
; PLAN: r0=1(x1), r1=86(y1), r2=265(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 86
LDI r2, 265
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
