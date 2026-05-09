; DESCRIPTION: Places a green line segment connecting (458, 57) to (114, 74).
; PLAN: r0=458(x1), r1=57(y1), r2=114(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 57
LDI r2, 114
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
