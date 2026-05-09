; DESCRIPTION: Renders a black line between points (157, 59) and (245, 230).
; PLAN: r0=157(x1), r1=59(y1), r2=245(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 59
LDI r2, 245
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
