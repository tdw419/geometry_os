; DESCRIPTION: Draws a yellow line from (330, 238) to (414, 94).
; PLAN: r0=330(x1), r1=238(y1), r2=414(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 238
LDI r2, 414
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
