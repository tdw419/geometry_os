; DESCRIPTION: Places a green line segment connecting (486, 141) to (374, 175).
; PLAN: r0=486(x1), r1=141(y1), r2=374(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 141
LDI r2, 374
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
