; DESCRIPTION: Draws a green line from (299, 119) to (495, 136).
; PLAN: r0=299(x1), r1=119(y1), r2=495(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 119
LDI r2, 495
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
