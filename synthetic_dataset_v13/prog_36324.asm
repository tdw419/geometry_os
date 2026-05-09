; DESCRIPTION: Renders a black line between points (148, 52) and (331, 95).
; PLAN: r0=148(x1), r1=52(y1), r2=331(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 52
LDI r2, 331
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
