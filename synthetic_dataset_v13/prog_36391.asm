; DESCRIPTION: Draws a black line from (69, 158) to (54, 233).
; PLAN: r0=69(x1), r1=158(y1), r2=54(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 158
LDI r2, 54
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
