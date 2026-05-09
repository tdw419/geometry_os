; DESCRIPTION: Draws a green line from (347, 169) to (214, 36).
; PLAN: r0=347(x1), r1=169(y1), r2=214(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 169
LDI r2, 214
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
