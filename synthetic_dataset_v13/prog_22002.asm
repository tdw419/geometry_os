; DESCRIPTION: Renders a orange line between points (161, 77) and (466, 215).
; PLAN: r0=161(x1), r1=77(y1), r2=466(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 77
LDI r2, 466
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
