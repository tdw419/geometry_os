; DESCRIPTION: Draws a green line from (286, 227) to (370, 241).
; PLAN: r0=286(x1), r1=227(y1), r2=370(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 227
LDI r2, 370
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
