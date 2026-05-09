; DESCRIPTION: Draws a yellow line from (68, 177) to (287, 244).
; PLAN: r0=68(x1), r1=177(y1), r2=287(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 177
LDI r2, 287
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
