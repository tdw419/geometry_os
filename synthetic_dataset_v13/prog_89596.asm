; DESCRIPTION: Renders a blue line between points (248, 60) and (198, 196).
; PLAN: r0=248(x1), r1=60(y1), r2=198(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 60
LDI r2, 198
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
