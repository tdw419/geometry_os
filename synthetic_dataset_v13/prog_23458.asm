; DESCRIPTION: Renders a black line between points (491, 21) and (255, 4).
; PLAN: r0=491(x1), r1=21(y1), r2=255(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 21
LDI r2, 255
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
