; DESCRIPTION: Renders a purple line between points (313, 108) and (74, 38).
; PLAN: r0=313(x1), r1=108(y1), r2=74(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 108
LDI r2, 74
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
