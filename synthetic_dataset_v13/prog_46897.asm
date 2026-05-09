; DESCRIPTION: Draws a yellow line from (302, 73) to (494, 47).
; PLAN: r0=302(x1), r1=73(y1), r2=494(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 73
LDI r2, 494
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
