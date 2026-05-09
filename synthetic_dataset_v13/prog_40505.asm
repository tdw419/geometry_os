; DESCRIPTION: Draws a green line from (127, 136) to (347, 241).
; PLAN: r0=127(x1), r1=136(y1), r2=347(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 136
LDI r2, 347
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
