; DESCRIPTION: Renders a black line between points (452, 48) and (181, 244).
; PLAN: r0=452(x1), r1=48(y1), r2=181(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 48
LDI r2, 181
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
