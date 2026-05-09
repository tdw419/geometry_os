; DESCRIPTION: Renders a red line between points (198, 78) and (253, 40).
; PLAN: r0=198(x1), r1=78(y1), r2=253(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 78
LDI r2, 253
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
