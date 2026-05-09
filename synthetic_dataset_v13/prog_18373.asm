; DESCRIPTION: Renders a black line between points (503, 107) and (375, 110).
; PLAN: r0=503(x1), r1=107(y1), r2=375(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 107
LDI r2, 375
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
