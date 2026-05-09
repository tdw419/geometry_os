; DESCRIPTION: Draws a yellow line from (137, 159) to (329, 237).
; PLAN: r0=137(x1), r1=159(y1), r2=329(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 159
LDI r2, 329
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
