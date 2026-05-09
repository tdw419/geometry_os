; DESCRIPTION: Renders a black line between points (312, 113) and (506, 207).
; PLAN: r0=312(x1), r1=113(y1), r2=506(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 113
LDI r2, 506
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
