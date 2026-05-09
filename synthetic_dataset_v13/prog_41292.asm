; DESCRIPTION: Draws a black line from (121, 104) to (323, 143).
; PLAN: r0=121(x1), r1=104(y1), r2=323(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 104
LDI r2, 323
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
