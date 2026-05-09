; DESCRIPTION: Renders a yellow line between points (10, 142) and (180, 227).
; PLAN: r0=10(x1), r1=142(y1), r2=180(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 142
LDI r2, 180
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
