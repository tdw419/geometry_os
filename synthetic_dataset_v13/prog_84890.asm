; DESCRIPTION: Renders a black line between points (396, 10) and (13, 48).
; PLAN: r0=396(x1), r1=10(y1), r2=13(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 10
LDI r2, 13
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
