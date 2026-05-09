; DESCRIPTION: Draws a black line from (204, 239) to (147, 107).
; PLAN: r0=204(x1), r1=239(y1), r2=147(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 239
LDI r2, 147
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
