; DESCRIPTION: Places a red line segment connecting (399, 121) to (256, 119).
; PLAN: r0=399(x1), r1=121(y1), r2=256(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 121
LDI r2, 256
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
