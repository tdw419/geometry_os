; DESCRIPTION: Renders a black line between points (160, 12) and (490, 226).
; PLAN: r0=160(x1), r1=12(y1), r2=490(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 12
LDI r2, 490
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
