; DESCRIPTION: Draws a yellow line from (458, 94) to (108, 129).
; PLAN: r0=458(x1), r1=94(y1), r2=108(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 94
LDI r2, 108
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
