; DESCRIPTION: Draws a yellow line from (96, 174) to (302, 247).
; PLAN: r0=96(x1), r1=174(y1), r2=302(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 174
LDI r2, 302
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
