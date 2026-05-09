; DESCRIPTION: Draws a white line from (90, 90) to (116, 17).
; PLAN: r0=90(x1), r1=90(y1), r2=116(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 90
LDI r2, 116
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
