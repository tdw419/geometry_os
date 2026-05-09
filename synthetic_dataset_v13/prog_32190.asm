; DESCRIPTION: Renders a black line between points (308, 163) and (273, 250).
; PLAN: r0=308(x1), r1=163(y1), r2=273(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 163
LDI r2, 273
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
