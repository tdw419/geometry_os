; DESCRIPTION: Draws a black line from (194, 218) to (436, 221).
; PLAN: r0=194(x1), r1=218(y1), r2=436(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 218
LDI r2, 436
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
