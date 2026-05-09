; DESCRIPTION: Draws a white line from (423, 187) to (190, 165).
; PLAN: r0=423(x1), r1=187(y1), r2=190(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 187
LDI r2, 190
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
