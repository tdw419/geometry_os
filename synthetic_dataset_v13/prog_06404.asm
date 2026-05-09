; DESCRIPTION: Places a blue line segment connecting (39, 38) to (70, 41).
; PLAN: r0=39(x1), r1=38(y1), r2=70(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 38
LDI r2, 70
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
