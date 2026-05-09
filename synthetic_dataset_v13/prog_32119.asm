; DESCRIPTION: Renders a black line between points (315, 22) and (109, 60).
; PLAN: r0=315(x1), r1=22(y1), r2=109(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 22
LDI r2, 109
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
