; DESCRIPTION: Renders a black line between points (179, 118) and (481, 125).
; PLAN: r0=179(x1), r1=118(y1), r2=481(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 118
LDI r2, 481
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
