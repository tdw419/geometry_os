; DESCRIPTION: Draws a green line from (102, 94) to (391, 34).
; PLAN: r0=102(x1), r1=94(y1), r2=391(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 94
LDI r2, 391
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
