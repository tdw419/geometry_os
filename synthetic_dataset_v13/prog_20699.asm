; DESCRIPTION: Places a black line segment connecting (73, 47) to (212, 30).
; PLAN: r0=73(x1), r1=47(y1), r2=212(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 47
LDI r2, 212
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
