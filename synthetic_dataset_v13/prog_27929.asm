; DESCRIPTION: Draws a red line from (476, 111) to (245, 169).
; PLAN: r0=476(x1), r1=111(y1), r2=245(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 111
LDI r2, 245
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
