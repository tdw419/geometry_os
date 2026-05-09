; DESCRIPTION: Renders a blue line between points (282, 132) and (15, 126).
; PLAN: r0=282(x1), r1=132(y1), r2=15(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 132
LDI r2, 15
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
