; DESCRIPTION: Draws a yellow line from (249, 195) to (62, 181).
; PLAN: r0=249(x1), r1=195(y1), r2=62(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 195
LDI r2, 62
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
