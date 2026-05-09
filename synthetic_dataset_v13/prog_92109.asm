; DESCRIPTION: Renders a black line between points (237, 113) and (265, 212).
; PLAN: r0=237(x1), r1=113(y1), r2=265(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 113
LDI r2, 265
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
