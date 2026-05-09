; DESCRIPTION: Renders a blue line between points (286, 83) and (352, 93).
; PLAN: r0=286(x1), r1=83(y1), r2=352(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 83
LDI r2, 352
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
