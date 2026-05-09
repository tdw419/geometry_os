; DESCRIPTION: Draws a white line from (10, 197) to (323, 34).
; PLAN: r0=10(x1), r1=197(y1), r2=323(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 197
LDI r2, 323
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
