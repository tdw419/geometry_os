; DESCRIPTION: Draws a purple line from (208, 210) to (38, 227).
; PLAN: r0=208(x1), r1=210(y1), r2=38(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 210
LDI r2, 38
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
