; DESCRIPTION: Draws a red line from (245, 82) to (314, 79).
; PLAN: r0=245(x1), r1=82(y1), r2=314(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 82
LDI r2, 314
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
