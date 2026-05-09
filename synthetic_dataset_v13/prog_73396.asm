; DESCRIPTION: Renders a white line between points (151, 198) and (10, 51).
; PLAN: r0=151(x1), r1=198(y1), r2=10(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 198
LDI r2, 10
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
