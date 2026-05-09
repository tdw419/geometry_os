; DESCRIPTION: Draws a black line from (238, 159) to (510, 101).
; PLAN: r0=238(x1), r1=159(y1), r2=510(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 159
LDI r2, 510
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
