; DESCRIPTION: Renders a black line between points (100, 21) and (124, 186).
; PLAN: r0=100(x1), r1=21(y1), r2=124(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 21
LDI r2, 124
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
