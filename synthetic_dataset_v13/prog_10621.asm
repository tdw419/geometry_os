; DESCRIPTION: Renders a blue line between points (47, 220) and (510, 43).
; PLAN: r0=47(x1), r1=220(y1), r2=510(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 220
LDI r2, 510
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
