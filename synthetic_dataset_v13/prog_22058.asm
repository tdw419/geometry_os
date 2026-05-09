; DESCRIPTION: Draws a blue line from (396, 14) to (182, 221).
; PLAN: r0=396(x1), r1=14(y1), r2=182(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 14
LDI r2, 182
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
