; DESCRIPTION: Draws a white line from (474, 217) to (74, 15).
; PLAN: r0=474(x1), r1=217(y1), r2=74(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 217
LDI r2, 74
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
