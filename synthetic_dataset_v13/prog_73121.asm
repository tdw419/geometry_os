; DESCRIPTION: Renders a black line between points (236, 236) and (25, 81).
; PLAN: r0=236(x1), r1=236(y1), r2=25(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 236
LDI r2, 25
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
