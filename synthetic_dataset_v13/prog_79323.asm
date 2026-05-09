; DESCRIPTION: Places a red line segment connecting (233, 164) to (189, 110).
; PLAN: r0=233(x1), r1=164(y1), r2=189(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 164
LDI r2, 189
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
