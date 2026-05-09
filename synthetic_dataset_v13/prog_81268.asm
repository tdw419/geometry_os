; DESCRIPTION: Renders a purple line between points (271, 135) and (438, 49).
; PLAN: r0=271(x1), r1=135(y1), r2=438(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 135
LDI r2, 438
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
