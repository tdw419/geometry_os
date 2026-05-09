; DESCRIPTION: Renders a black line between points (315, 235) and (221, 219).
; PLAN: r0=315(x1), r1=235(y1), r2=221(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 235
LDI r2, 221
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
