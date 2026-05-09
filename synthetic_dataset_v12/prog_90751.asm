; DESCRIPTION: Renders a black line between points (325, 47) and (435, 200).
; PLAN: r0=325(x1), r1=47(y1), r2=435(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 47
LDI r2, 435
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
