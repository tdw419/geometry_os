; DESCRIPTION: Draws a red line from (170, 62) to (291, 211).
; PLAN: r0=170(x1), r1=62(y1), r2=291(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 62
LDI r2, 291
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
