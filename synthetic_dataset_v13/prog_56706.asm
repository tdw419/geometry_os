; DESCRIPTION: Draws a red line from (375, 205) to (7, 104).
; PLAN: r0=375(x1), r1=205(y1), r2=7(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 205
LDI r2, 7
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
