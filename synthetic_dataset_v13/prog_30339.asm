; DESCRIPTION: Places a green line segment connecting (423, 39) to (486, 118).
; PLAN: r0=423(x1), r1=39(y1), r2=486(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 39
LDI r2, 486
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
