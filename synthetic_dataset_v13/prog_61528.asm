; DESCRIPTION: Draws a red line from (98, 227) to (492, 221).
; PLAN: r0=98(x1), r1=227(y1), r2=492(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 227
LDI r2, 492
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
