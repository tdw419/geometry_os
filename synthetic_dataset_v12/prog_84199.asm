; DESCRIPTION: Draws a red line from (12, 165) to (198, 25).
; PLAN: r0=12(x1), r1=165(y1), r2=198(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 165
LDI r2, 198
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
