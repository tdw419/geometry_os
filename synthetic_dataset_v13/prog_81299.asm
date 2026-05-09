; DESCRIPTION: Places a orange line segment connecting (296, 187) to (3, 243).
; PLAN: r0=296(x1), r1=187(y1), r2=3(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 187
LDI r2, 3
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
