; DESCRIPTION: Renders a blue line between points (283, 38) and (307, 179).
; PLAN: r0=283(x1), r1=38(y1), r2=307(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 38
LDI r2, 307
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
