; DESCRIPTION: Renders a blue line between points (316, 29) and (356, 231).
; PLAN: r0=316(x1), r1=29(y1), r2=356(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 29
LDI r2, 356
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
