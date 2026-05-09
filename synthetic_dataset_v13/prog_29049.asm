; DESCRIPTION: Renders a green line between points (137, 15) and (469, 180).
; PLAN: r0=137(x1), r1=15(y1), r2=469(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 15
LDI r2, 469
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
