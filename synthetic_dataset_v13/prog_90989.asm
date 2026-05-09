; DESCRIPTION: Renders a black line between points (236, 71) and (358, 134).
; PLAN: r0=236(x1), r1=71(y1), r2=358(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 71
LDI r2, 358
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
