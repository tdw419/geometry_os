; DESCRIPTION: Draws a black line from (70, 26) to (451, 223).
; PLAN: r0=70(x1), r1=26(y1), r2=451(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 26
LDI r2, 451
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
