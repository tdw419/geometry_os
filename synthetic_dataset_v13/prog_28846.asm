; DESCRIPTION: Renders a black line between points (446, 104) and (376, 0).
; PLAN: r0=446(x1), r1=104(y1), r2=376(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 104
LDI r2, 376
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
