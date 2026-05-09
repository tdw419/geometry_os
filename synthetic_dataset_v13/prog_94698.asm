; DESCRIPTION: Renders a blue line between points (14, 202) and (172, 54).
; PLAN: r0=14(x1), r1=202(y1), r2=172(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 202
LDI r2, 172
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
