; DESCRIPTION: Draws a yellow line from (71, 85) to (46, 206).
; PLAN: r0=71(x1), r1=85(y1), r2=46(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 85
LDI r2, 46
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
