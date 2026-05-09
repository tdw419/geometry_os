; DESCRIPTION: Renders a green line between points (219, 113) and (432, 113).
; PLAN: r0=219(x1), r1=113(y1), r2=432(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 113
LDI r2, 432
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
