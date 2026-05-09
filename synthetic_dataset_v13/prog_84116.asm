; DESCRIPTION: Draws a red line from (21, 104) to (376, 47).
; PLAN: r0=21(x1), r1=104(y1), r2=376(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 104
LDI r2, 376
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
