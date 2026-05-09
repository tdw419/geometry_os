; DESCRIPTION: Renders a black line between points (121, 81) and (360, 44).
; PLAN: r0=121(x1), r1=81(y1), r2=360(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 81
LDI r2, 360
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
