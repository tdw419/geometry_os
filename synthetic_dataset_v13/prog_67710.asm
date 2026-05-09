; DESCRIPTION: Renders a blue line between points (288, 101) and (128, 54).
; PLAN: r0=288(x1), r1=101(y1), r2=128(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 101
LDI r2, 128
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
