; DESCRIPTION: Places a cyan line segment connecting (353, 118) to (409, 247).
; PLAN: r0=353(x1), r1=118(y1), r2=409(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 118
LDI r2, 409
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
