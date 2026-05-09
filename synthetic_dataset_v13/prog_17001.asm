; DESCRIPTION: Draws a black line from (143, 121) to (176, 101).
; PLAN: r0=143(x1), r1=121(y1), r2=176(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 121
LDI r2, 176
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
