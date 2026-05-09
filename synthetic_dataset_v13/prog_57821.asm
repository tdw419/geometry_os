; DESCRIPTION: Draws a purple line from (445, 148) to (245, 227).
; PLAN: r0=445(x1), r1=148(y1), r2=245(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 148
LDI r2, 245
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
