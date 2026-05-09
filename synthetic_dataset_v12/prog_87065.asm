; DESCRIPTION: Renders a blue line between points (303, 28) and (14, 25).
; PLAN: r0=303(x1), r1=28(y1), r2=14(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 28
LDI r2, 14
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
