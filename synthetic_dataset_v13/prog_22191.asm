; DESCRIPTION: Draws a white line from (246, 104) to (490, 255).
; PLAN: r0=246(x1), r1=104(y1), r2=490(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 104
LDI r2, 490
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
