; DESCRIPTION: Draws a black line from (471, 176) to (403, 18).
; PLAN: r0=471(x1), r1=176(y1), r2=403(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 176
LDI r2, 403
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
