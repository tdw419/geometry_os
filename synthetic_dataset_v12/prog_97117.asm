; DESCRIPTION: Renders a red line between points (196, 70) and (76, 170).
; PLAN: r0=196(x1), r1=70(y1), r2=76(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 70
LDI r2, 76
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
