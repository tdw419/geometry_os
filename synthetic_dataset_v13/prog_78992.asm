; DESCRIPTION: Renders a black line between points (320, 14) and (51, 104).
; PLAN: r0=320(x1), r1=14(y1), r2=51(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 14
LDI r2, 51
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
