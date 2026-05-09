; DESCRIPTION: Places a orange line segment connecting (225, 73) to (198, 24).
; PLAN: r0=225(x1), r1=73(y1), r2=198(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 73
LDI r2, 198
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
