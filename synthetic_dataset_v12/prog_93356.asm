; DESCRIPTION: Draws a purple line from (187, 139) to (245, 52).
; PLAN: r0=187(x1), r1=139(y1), r2=245(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 139
LDI r2, 245
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
