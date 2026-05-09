; DESCRIPTION: Renders a blue line between points (14, 104) and (446, 240).
; PLAN: r0=14(x1), r1=104(y1), r2=446(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 104
LDI r2, 446
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
