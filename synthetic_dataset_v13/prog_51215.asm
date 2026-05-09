; DESCRIPTION: Draws a black line from (218, 157) to (457, 227).
; PLAN: r0=218(x1), r1=157(y1), r2=457(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 157
LDI r2, 457
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
