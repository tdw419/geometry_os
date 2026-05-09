; DESCRIPTION: Draws a magenta line from (214, 227) to (139, 167).
; PLAN: r0=214(x1), r1=227(y1), r2=139(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 227
LDI r2, 139
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
