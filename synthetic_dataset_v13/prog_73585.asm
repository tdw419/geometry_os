; DESCRIPTION: Renders a red line between points (491, 128) and (490, 135).
; PLAN: r0=491(x1), r1=128(y1), r2=490(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 128
LDI r2, 490
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
