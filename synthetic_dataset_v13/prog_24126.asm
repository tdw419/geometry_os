; DESCRIPTION: Renders a black line between points (19, 220) and (356, 153).
; PLAN: r0=19(x1), r1=220(y1), r2=356(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 220
LDI r2, 356
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
