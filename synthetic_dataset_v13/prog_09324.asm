; DESCRIPTION: Renders a blue line between points (160, 167) and (72, 26).
; PLAN: r0=160(x1), r1=167(y1), r2=72(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 167
LDI r2, 72
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
