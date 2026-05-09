; DESCRIPTION: Draws a red line from (423, 77) to (207, 29).
; PLAN: r0=423(x1), r1=77(y1), r2=207(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 77
LDI r2, 207
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
