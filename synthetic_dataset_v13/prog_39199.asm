; DESCRIPTION: Renders a black line between points (12, 227) and (125, 125).
; PLAN: r0=12(x1), r1=227(y1), r2=125(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 227
LDI r2, 125
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
