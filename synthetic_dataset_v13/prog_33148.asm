; DESCRIPTION: Draws a red line from (30, 174) to (144, 104).
; PLAN: r0=30(x1), r1=174(y1), r2=144(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 174
LDI r2, 144
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
