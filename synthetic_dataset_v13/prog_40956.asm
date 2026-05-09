; DESCRIPTION: Draws a orange line from (353, 37) to (5, 38).
; PLAN: r0=353(x1), r1=37(y1), r2=5(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 37
LDI r2, 5
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
