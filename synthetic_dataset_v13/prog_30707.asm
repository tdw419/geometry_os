; DESCRIPTION: Renders a purple line between points (492, 60) and (198, 57).
; PLAN: r0=492(x1), r1=60(y1), r2=198(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 60
LDI r2, 198
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
