; DESCRIPTION: Draws a red line from (1, 197) to (471, 238).
; PLAN: r0=1(x1), r1=197(y1), r2=471(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 197
LDI r2, 471
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
