; DESCRIPTION: Draws a black line from (95, 80) to (376, 214).
; PLAN: r0=95(x1), r1=80(y1), r2=376(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 80
LDI r2, 376
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
