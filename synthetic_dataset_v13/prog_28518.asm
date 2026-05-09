; DESCRIPTION: Renders a black line between points (65, 51) and (329, 204).
; PLAN: r0=65(x1), r1=51(y1), r2=329(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 51
LDI r2, 329
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
