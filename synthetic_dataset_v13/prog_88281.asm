; DESCRIPTION: Draws a orange line from (108, 243) to (436, 133).
; PLAN: r0=108(x1), r1=243(y1), r2=436(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 243
LDI r2, 436
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
