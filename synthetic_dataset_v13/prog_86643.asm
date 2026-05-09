; DESCRIPTION: Renders a green line between points (353, 227) and (171, 252).
; PLAN: r0=353(x1), r1=227(y1), r2=171(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 227
LDI r2, 171
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
