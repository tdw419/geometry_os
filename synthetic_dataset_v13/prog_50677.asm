; DESCRIPTION: Draws a black line from (12, 204) to (327, 122).
; PLAN: r0=12(x1), r1=204(y1), r2=327(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 204
LDI r2, 327
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
