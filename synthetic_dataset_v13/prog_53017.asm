; DESCRIPTION: Renders a red line between points (492, 134) and (383, 110).
; PLAN: r0=492(x1), r1=134(y1), r2=383(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 134
LDI r2, 383
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
