; DESCRIPTION: Draws a red line from (70, 49) to (207, 47).
; PLAN: r0=70(x1), r1=49(y1), r2=207(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 49
LDI r2, 207
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
