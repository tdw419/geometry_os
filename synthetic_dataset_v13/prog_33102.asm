; DESCRIPTION: Renders a green line between points (371, 183) and (489, 88).
; PLAN: r0=371(x1), r1=183(y1), r2=489(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 183
LDI r2, 489
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
