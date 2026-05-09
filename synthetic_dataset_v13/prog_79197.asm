; DESCRIPTION: Draws a black line from (403, 167) to (280, 248).
; PLAN: r0=403(x1), r1=167(y1), r2=280(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 167
LDI r2, 280
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
