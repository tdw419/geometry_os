; DESCRIPTION: Renders a black line between points (82, 125) and (476, 201).
; PLAN: r0=82(x1), r1=125(y1), r2=476(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 125
LDI r2, 476
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
