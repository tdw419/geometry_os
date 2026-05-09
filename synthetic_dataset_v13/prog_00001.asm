; DESCRIPTION: Renders a purple line between points (72, 164) and (198, 74).
; PLAN: r0=72(x1), r1=164(y1), r2=198(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 164
LDI r2, 198
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
