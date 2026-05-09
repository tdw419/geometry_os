; DESCRIPTION: Draws a yellow line from (361, 90) to (385, 14).
; PLAN: r0=361(x1), r1=90(y1), r2=385(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 90
LDI r2, 385
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
