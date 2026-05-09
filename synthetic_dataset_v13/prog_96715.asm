; DESCRIPTION: Renders a black line between points (296, 108) and (318, 206).
; PLAN: r0=296(x1), r1=108(y1), r2=318(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 108
LDI r2, 318
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
