; DESCRIPTION: Draws a green line from (8, 0) to (191, 136).
; PLAN: r0=8(x1), r1=0(y1), r2=191(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 0
LDI r2, 191
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
