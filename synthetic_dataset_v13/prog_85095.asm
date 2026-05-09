; DESCRIPTION: Renders a red line between points (48, 105) and (87, 22).
; PLAN: r0=48(x1), r1=105(y1), r2=87(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 105
LDI r2, 87
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
