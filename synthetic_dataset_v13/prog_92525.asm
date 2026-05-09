; DESCRIPTION: Renders a white line between points (33, 120) and (296, 219).
; PLAN: r0=33(x1), r1=120(y1), r2=296(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 120
LDI r2, 296
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
