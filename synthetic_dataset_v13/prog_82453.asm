; DESCRIPTION: Draws a red line from (486, 66) to (384, 17).
; PLAN: r0=486(x1), r1=66(y1), r2=384(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 66
LDI r2, 384
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
