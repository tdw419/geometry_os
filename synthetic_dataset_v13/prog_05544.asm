; DESCRIPTION: Draws a green line from (491, 141) to (29, 254).
; PLAN: r0=491(x1), r1=141(y1), r2=29(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 141
LDI r2, 29
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
