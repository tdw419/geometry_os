; DESCRIPTION: Draws a white line from (172, 57) to (306, 153).
; PLAN: r0=172(x1), r1=57(y1), r2=306(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 57
LDI r2, 306
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
