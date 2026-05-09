; DESCRIPTION: Renders a black line between points (182, 118) and (293, 173).
; PLAN: r0=182(x1), r1=118(y1), r2=293(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 118
LDI r2, 293
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
