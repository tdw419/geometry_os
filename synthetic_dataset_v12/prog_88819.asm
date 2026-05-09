; DESCRIPTION: Renders a purple line between points (506, 164) and (281, 22).
; PLAN: r0=506(x1), r1=164(y1), r2=281(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 164
LDI r2, 281
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
