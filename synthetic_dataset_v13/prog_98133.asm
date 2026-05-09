; DESCRIPTION: Draws a red line from (222, 57) to (11, 178).
; PLAN: r0=222(x1), r1=57(y1), r2=11(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 57
LDI r2, 11
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
