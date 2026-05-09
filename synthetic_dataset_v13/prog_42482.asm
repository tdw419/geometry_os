; DESCRIPTION: Renders a white line between points (349, 184) and (51, 244).
; PLAN: r0=349(x1), r1=184(y1), r2=51(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 184
LDI r2, 51
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
