; DESCRIPTION: Renders a black line between points (103, 251) and (387, 212).
; PLAN: r0=103(x1), r1=251(y1), r2=387(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 251
LDI r2, 387
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
