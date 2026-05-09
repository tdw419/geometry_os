; DESCRIPTION: Renders a green line between points (288, 229) and (78, 212).
; PLAN: r0=288(x1), r1=229(y1), r2=78(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 229
LDI r2, 78
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
