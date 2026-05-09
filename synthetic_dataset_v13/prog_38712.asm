; DESCRIPTION: Draws a purple line from (55, 221) to (290, 165).
; PLAN: r0=55(x1), r1=221(y1), r2=290(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 221
LDI r2, 290
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
