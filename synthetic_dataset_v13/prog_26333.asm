; DESCRIPTION: Renders a purple line between points (18, 113) and (32, 108).
; PLAN: r0=18(x1), r1=113(y1), r2=32(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 113
LDI r2, 32
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
