; DESCRIPTION: Renders a black line between points (463, 127) and (276, 180).
; PLAN: r0=463(x1), r1=127(y1), r2=276(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 127
LDI r2, 276
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
