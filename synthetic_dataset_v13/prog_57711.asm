; DESCRIPTION: Renders a red line between points (310, 141) and (219, 8).
; PLAN: r0=310(x1), r1=141(y1), r2=219(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 141
LDI r2, 219
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
