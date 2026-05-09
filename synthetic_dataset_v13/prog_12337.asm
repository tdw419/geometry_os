; DESCRIPTION: Renders a red line between points (38, 132) and (282, 51).
; PLAN: r0=38(x1), r1=132(y1), r2=282(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 132
LDI r2, 282
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
