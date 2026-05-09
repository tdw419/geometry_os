; DESCRIPTION: Renders a green line between points (78, 89) and (261, 173).
; PLAN: r0=78(x1), r1=89(y1), r2=261(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 89
LDI r2, 261
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
