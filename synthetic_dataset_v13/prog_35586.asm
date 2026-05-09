; DESCRIPTION: Draws a yellow line from (380, 227) to (43, 167).
; PLAN: r0=380(x1), r1=227(y1), r2=43(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 227
LDI r2, 43
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
