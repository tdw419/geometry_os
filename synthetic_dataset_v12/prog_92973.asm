; DESCRIPTION: Renders a black line between points (265, 243) and (12, 84).
; PLAN: r0=265(x1), r1=243(y1), r2=12(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 243
LDI r2, 12
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
