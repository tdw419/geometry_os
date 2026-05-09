; DESCRIPTION: Draws a green line from (347, 232) to (130, 221).
; PLAN: r0=347(x1), r1=232(y1), r2=130(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 232
LDI r2, 130
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
