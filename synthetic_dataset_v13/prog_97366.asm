; DESCRIPTION: Renders a blue line between points (28, 219) and (97, 187).
; PLAN: r0=28(x1), r1=219(y1), r2=97(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 219
LDI r2, 97
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
