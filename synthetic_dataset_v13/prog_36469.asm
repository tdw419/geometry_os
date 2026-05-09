; DESCRIPTION: Renders a black line between points (105, 177) and (215, 89).
; PLAN: r0=105(x1), r1=177(y1), r2=215(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 177
LDI r2, 215
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
