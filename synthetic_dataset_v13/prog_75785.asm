; DESCRIPTION: Renders a black line between points (200, 196) and (38, 200).
; PLAN: r0=200(x1), r1=196(y1), r2=38(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 196
LDI r2, 38
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
