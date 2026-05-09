; DESCRIPTION: Draws a yellow line from (156, 94) to (424, 72).
; PLAN: r0=156(x1), r1=94(y1), r2=424(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 94
LDI r2, 424
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
