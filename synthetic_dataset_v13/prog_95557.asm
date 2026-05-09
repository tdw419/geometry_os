; DESCRIPTION: Renders a blue line between points (313, 10) and (107, 135).
; PLAN: r0=313(x1), r1=10(y1), r2=107(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 10
LDI r2, 107
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
