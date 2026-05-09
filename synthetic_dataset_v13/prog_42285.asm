; DESCRIPTION: Renders a blue line between points (138, 249) and (75, 34).
; PLAN: r0=138(x1), r1=249(y1), r2=75(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 249
LDI r2, 75
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
