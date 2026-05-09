; DESCRIPTION: Renders a green line between points (489, 41) and (409, 237).
; PLAN: r0=489(x1), r1=41(y1), r2=409(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 41
LDI r2, 409
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
