; DESCRIPTION: Draws a yellow line from (275, 158) to (394, 230).
; PLAN: r0=275(x1), r1=158(y1), r2=394(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 158
LDI r2, 394
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
