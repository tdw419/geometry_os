; DESCRIPTION: Draws a yellow line from (217, 118) to (475, 187).
; PLAN: r0=217(x1), r1=118(y1), r2=475(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 118
LDI r2, 475
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
