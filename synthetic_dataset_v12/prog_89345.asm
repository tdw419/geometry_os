; DESCRIPTION: Draws a orange line from (385, 205) to (317, 182).
; PLAN: r0=385(x1), r1=205(y1), r2=317(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 205
LDI r2, 317
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
