; DESCRIPTION: Places a black line segment connecting (60, 44) to (461, 25).
; PLAN: r0=60(x1), r1=44(y1), r2=461(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 44
LDI r2, 461
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
