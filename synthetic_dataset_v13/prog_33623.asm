; DESCRIPTION: Draws a green line from (74, 123) to (472, 14).
; PLAN: r0=74(x1), r1=123(y1), r2=472(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 123
LDI r2, 472
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
