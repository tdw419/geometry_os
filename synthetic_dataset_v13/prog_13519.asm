; DESCRIPTION: Places a black line segment connecting (134, 93) to (39, 62).
; PLAN: r0=134(x1), r1=93(y1), r2=39(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 93
LDI r2, 39
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
