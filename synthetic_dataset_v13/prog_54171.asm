; DESCRIPTION: Renders a green line between points (505, 112) and (40, 49).
; PLAN: r0=505(x1), r1=112(y1), r2=40(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 112
LDI r2, 40
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
