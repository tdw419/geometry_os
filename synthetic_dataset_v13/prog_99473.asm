; DESCRIPTION: Renders a red line between points (78, 74) and (91, 33).
; PLAN: r0=78(x1), r1=74(y1), r2=91(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 74
LDI r2, 91
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
