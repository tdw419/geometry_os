; DESCRIPTION: Renders a black line between points (118, 110) and (284, 62).
; PLAN: r0=118(x1), r1=110(y1), r2=284(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 110
LDI r2, 284
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
