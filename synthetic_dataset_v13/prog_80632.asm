; DESCRIPTION: Renders a purple line between points (9, 50) and (215, 227).
; PLAN: r0=9(x1), r1=50(y1), r2=215(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 50
LDI r2, 215
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
