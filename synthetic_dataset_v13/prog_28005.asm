; DESCRIPTION: Places a green line segment connecting (358, 41) to (324, 175).
; PLAN: r0=358(x1), r1=41(y1), r2=324(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 41
LDI r2, 324
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
