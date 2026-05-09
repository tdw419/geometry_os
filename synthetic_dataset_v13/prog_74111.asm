; DESCRIPTION: Draws a orange line from (333, 71) to (136, 218).
; PLAN: r0=333(x1), r1=71(y1), r2=136(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 71
LDI r2, 136
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
