; DESCRIPTION: Renders a blue line between points (435, 25) and (171, 193).
; PLAN: r0=435(x1), r1=25(y1), r2=171(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 25
LDI r2, 171
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
