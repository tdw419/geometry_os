; DESCRIPTION: Renders a black line between points (453, 87) and (60, 179).
; PLAN: r0=453(x1), r1=87(y1), r2=60(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 87
LDI r2, 60
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
