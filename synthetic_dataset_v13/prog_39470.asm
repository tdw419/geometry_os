; DESCRIPTION: Renders a white line between points (315, 88) and (271, 41).
; PLAN: r0=315(x1), r1=88(y1), r2=271(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 88
LDI r2, 271
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
