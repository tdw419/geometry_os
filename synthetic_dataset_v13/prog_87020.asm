; DESCRIPTION: Draws a yellow line from (361, 36) to (182, 188).
; PLAN: r0=361(x1), r1=36(y1), r2=182(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 36
LDI r2, 182
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
