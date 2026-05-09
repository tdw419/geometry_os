; DESCRIPTION: Draws a yellow line from (424, 36) to (433, 156).
; PLAN: r0=424(x1), r1=36(y1), r2=433(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 36
LDI r2, 433
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
