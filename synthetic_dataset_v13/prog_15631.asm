; DESCRIPTION: Draws a yellow line from (302, 95) to (276, 202).
; PLAN: r0=302(x1), r1=95(y1), r2=276(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 95
LDI r2, 276
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
