; DESCRIPTION: Places a black line segment connecting (210, 50) to (232, 165).
; PLAN: r0=210(x1), r1=50(y1), r2=232(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 50
LDI r2, 232
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
