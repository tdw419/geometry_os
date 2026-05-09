; DESCRIPTION: Places a green line segment connecting (370, 138) to (9, 233).
; PLAN: r0=370(x1), r1=138(y1), r2=9(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 138
LDI r2, 9
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
