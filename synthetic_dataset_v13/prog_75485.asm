; DESCRIPTION: Renders a red line between points (78, 16) and (366, 70).
; PLAN: r0=78(x1), r1=16(y1), r2=366(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 16
LDI r2, 366
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
