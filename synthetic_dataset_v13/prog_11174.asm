; DESCRIPTION: Renders a yellow line between points (296, 175) and (219, 141).
; PLAN: r0=296(x1), r1=175(y1), r2=219(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 175
LDI r2, 219
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
