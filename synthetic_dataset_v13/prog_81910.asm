; DESCRIPTION: Places a green line segment connecting (290, 78) to (74, 31).
; PLAN: r0=290(x1), r1=78(y1), r2=74(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 78
LDI r2, 74
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
