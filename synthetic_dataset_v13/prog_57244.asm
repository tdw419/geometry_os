; DESCRIPTION: Draws a white line from (495, 190) to (2, 1).
; PLAN: r0=495(x1), r1=190(y1), r2=2(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 190
LDI r2, 2
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
