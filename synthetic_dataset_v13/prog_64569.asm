; DESCRIPTION: Draws a red line from (258, 36) to (436, 214).
; PLAN: r0=258(x1), r1=36(y1), r2=436(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 36
LDI r2, 436
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
