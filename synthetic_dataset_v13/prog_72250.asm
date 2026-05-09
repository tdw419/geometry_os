; DESCRIPTION: Renders a green line between points (33, 158) and (359, 196).
; PLAN: r0=33(x1), r1=158(y1), r2=359(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 158
LDI r2, 359
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
