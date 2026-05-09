; DESCRIPTION: Renders a black line between points (172, 157) and (202, 119).
; PLAN: r0=172(x1), r1=157(y1), r2=202(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 157
LDI r2, 202
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
