; DESCRIPTION: Renders a purple line between points (62, 223) and (206, 29).
; PLAN: r0=62(x1), r1=223(y1), r2=206(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 223
LDI r2, 206
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
