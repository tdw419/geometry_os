; DESCRIPTION: Draws a yellow line from (494, 32) to (26, 169).
; PLAN: r0=494(x1), r1=32(y1), r2=26(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 32
LDI r2, 26
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
