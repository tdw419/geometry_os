; DESCRIPTION: Draws a red line from (420, 153) to (494, 169).
; PLAN: r0=420(x1), r1=153(y1), r2=494(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 153
LDI r2, 494
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
