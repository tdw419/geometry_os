; DESCRIPTION: Renders a black line between points (282, 30) and (50, 25).
; PLAN: r0=282(x1), r1=30(y1), r2=50(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 30
LDI r2, 50
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
