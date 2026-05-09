; DESCRIPTION: Renders a green line between points (505, 210) and (332, 101).
; PLAN: r0=505(x1), r1=210(y1), r2=332(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 210
LDI r2, 332
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
