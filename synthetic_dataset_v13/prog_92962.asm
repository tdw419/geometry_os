; DESCRIPTION: Renders a black line between points (246, 29) and (204, 171).
; PLAN: r0=246(x1), r1=29(y1), r2=204(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 29
LDI r2, 204
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
