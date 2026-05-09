; DESCRIPTION: Draws a red line from (370, 110) to (107, 197).
; PLAN: r0=370(x1), r1=110(y1), r2=107(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 110
LDI r2, 107
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
