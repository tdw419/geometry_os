; DESCRIPTION: Places a white line segment connecting (423, 212) to (290, 108).
; PLAN: r0=423(x1), r1=212(y1), r2=290(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 212
LDI r2, 290
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
