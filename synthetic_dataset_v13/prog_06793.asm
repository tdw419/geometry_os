; DESCRIPTION: Places a blue line segment connecting (171, 83) to (433, 41).
; PLAN: r0=171(x1), r1=83(y1), r2=433(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 83
LDI r2, 433
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
