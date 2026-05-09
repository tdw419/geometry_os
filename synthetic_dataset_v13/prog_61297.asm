; DESCRIPTION: Renders a purple line between points (198, 181) and (327, 47).
; PLAN: r0=198(x1), r1=181(y1), r2=327(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 181
LDI r2, 327
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
