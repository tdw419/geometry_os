; DESCRIPTION: Draws a green line from (214, 156) to (176, 230).
; PLAN: r0=214(x1), r1=156(y1), r2=176(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 156
LDI r2, 176
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
