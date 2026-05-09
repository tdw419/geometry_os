; DESCRIPTION: Draws a black line from (97, 204) to (36, 3).
; PLAN: r0=97(x1), r1=204(y1), r2=36(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 204
LDI r2, 36
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
