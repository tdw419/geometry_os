; DESCRIPTION: Renders a red line between points (385, 83) and (223, 24).
; PLAN: r0=385(x1), r1=83(y1), r2=223(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 83
LDI r2, 223
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
