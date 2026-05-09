; DESCRIPTION: Draws a red line from (98, 197) to (505, 233).
; PLAN: r0=98(x1), r1=197(y1), r2=505(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 197
LDI r2, 505
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
