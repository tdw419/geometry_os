; DESCRIPTION: Draws a black line from (43, 233) to (335, 44).
; PLAN: r0=43(x1), r1=233(y1), r2=335(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 233
LDI r2, 335
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
