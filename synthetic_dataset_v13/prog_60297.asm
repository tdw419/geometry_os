; DESCRIPTION: Draws a white line from (141, 116) to (495, 104).
; PLAN: r0=141(x1), r1=116(y1), r2=495(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 116
LDI r2, 495
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
