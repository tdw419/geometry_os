; DESCRIPTION: Draws a red line from (71, 232) to (481, 36).
; PLAN: r0=71(x1), r1=232(y1), r2=481(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 232
LDI r2, 481
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
