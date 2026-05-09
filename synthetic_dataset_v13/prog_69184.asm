; DESCRIPTION: Renders a black line between points (325, 207) and (360, 131).
; PLAN: r0=325(x1), r1=207(y1), r2=360(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 207
LDI r2, 360
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
