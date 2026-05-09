; DESCRIPTION: Places a red line segment connecting (73, 244) to (105, 159).
; PLAN: r0=73(x1), r1=244(y1), r2=105(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 244
LDI r2, 105
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
