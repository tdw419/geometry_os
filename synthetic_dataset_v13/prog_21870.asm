; DESCRIPTION: Renders a black line between points (277, 78) and (312, 222).
; PLAN: r0=277(x1), r1=78(y1), r2=312(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 78
LDI r2, 312
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
