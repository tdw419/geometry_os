; DESCRIPTION: Renders a blue line between points (370, 47) and (435, 207).
; PLAN: r0=370(x1), r1=47(y1), r2=435(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 47
LDI r2, 435
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
