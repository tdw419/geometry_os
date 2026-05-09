; DESCRIPTION: Draws a orange line from (43, 249) to (54, 30).
; PLAN: r0=43(x1), r1=249(y1), r2=54(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 249
LDI r2, 54
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
