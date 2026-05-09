; DESCRIPTION: Draws a yellow line from (477, 234) to (70, 194).
; PLAN: r0=477(x1), r1=234(y1), r2=70(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 234
LDI r2, 70
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
