; DESCRIPTION: Renders a blue line between points (198, 55) and (505, 14).
; PLAN: r0=198(x1), r1=55(y1), r2=505(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 55
LDI r2, 505
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
