; DESCRIPTION: Renders a blue line between points (88, 44) and (88, 16).
; PLAN: r0=88(x1), r1=44(y1), r2=88(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 44
LDI r2, 88
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
