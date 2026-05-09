; DESCRIPTION: Renders a black line between points (442, 104) and (285, 6).
; PLAN: r0=442(x1), r1=104(y1), r2=285(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 104
LDI r2, 285
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
