; DESCRIPTION: Renders a blue line between points (49, 192) and (70, 223).
; PLAN: r0=49(x1), r1=192(y1), r2=70(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 192
LDI r2, 70
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
