; DESCRIPTION: Draws a black line from (336, 225) to (218, 101).
; PLAN: r0=336(x1), r1=225(y1), r2=218(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 225
LDI r2, 218
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
