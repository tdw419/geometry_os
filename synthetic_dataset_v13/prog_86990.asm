; DESCRIPTION: Draws a black line from (385, 174) to (409, 254).
; PLAN: r0=385(x1), r1=174(y1), r2=409(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 174
LDI r2, 409
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
