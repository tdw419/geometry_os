; DESCRIPTION: Renders a black line between points (283, 14) and (400, 118).
; PLAN: r0=283(x1), r1=14(y1), r2=400(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 14
LDI r2, 400
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
