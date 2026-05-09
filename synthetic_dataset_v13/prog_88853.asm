; DESCRIPTION: Renders a black line between points (493, 235) and (73, 14).
; PLAN: r0=493(x1), r1=235(y1), r2=73(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 235
LDI r2, 73
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
