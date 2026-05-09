; DESCRIPTION: Draws a yellow line from (303, 141) to (238, 185).
; PLAN: r0=303(x1), r1=141(y1), r2=238(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 141
LDI r2, 238
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
