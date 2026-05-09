; DESCRIPTION: Renders a black line between points (215, 66) and (245, 51).
; PLAN: r0=215(x1), r1=66(y1), r2=245(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 66
LDI r2, 245
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
