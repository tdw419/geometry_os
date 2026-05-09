; DESCRIPTION: Draws a black line from (301, 117) to (434, 129).
; PLAN: r0=301(x1), r1=117(y1), r2=434(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 117
LDI r2, 434
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
