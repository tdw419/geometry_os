; DESCRIPTION: Renders a green line between points (366, 14) and (195, 36).
; PLAN: r0=366(x1), r1=14(y1), r2=195(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 14
LDI r2, 195
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
