; DESCRIPTION: Renders a purple line between points (366, 19) and (291, 236).
; PLAN: r0=366(x1), r1=19(y1), r2=291(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 19
LDI r2, 291
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
