; DESCRIPTION: Draws a black line from (116, 31) to (321, 141).
; PLAN: r0=116(x1), r1=31(y1), r2=321(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 31
LDI r2, 321
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
