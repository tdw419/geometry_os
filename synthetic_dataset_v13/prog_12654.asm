; DESCRIPTION: Renders a green line between points (227, 21) and (315, 10).
; PLAN: r0=227(x1), r1=21(y1), r2=315(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 21
LDI r2, 315
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
