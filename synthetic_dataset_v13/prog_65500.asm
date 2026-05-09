; DESCRIPTION: Renders a white line between points (296, 49) and (447, 101).
; PLAN: r0=296(x1), r1=49(y1), r2=447(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 49
LDI r2, 447
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
