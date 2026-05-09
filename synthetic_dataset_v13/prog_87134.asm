; DESCRIPTION: Renders a blue line between points (249, 72) and (281, 84).
; PLAN: r0=249(x1), r1=72(y1), r2=281(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 72
LDI r2, 281
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
