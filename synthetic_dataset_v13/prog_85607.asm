; DESCRIPTION: Draws a purple line from (353, 180) to (245, 14).
; PLAN: r0=353(x1), r1=180(y1), r2=245(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 180
LDI r2, 245
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
