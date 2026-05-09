; DESCRIPTION: Places a red line segment connecting (455, 119) to (409, 107).
; PLAN: r0=455(x1), r1=119(y1), r2=409(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 119
LDI r2, 409
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
