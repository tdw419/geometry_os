; DESCRIPTION: Renders a black line between points (148, 172) and (153, 8).
; PLAN: r0=148(x1), r1=172(y1), r2=153(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 172
LDI r2, 153
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
