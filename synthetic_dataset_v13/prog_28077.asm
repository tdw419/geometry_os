; DESCRIPTION: Draws a white line from (436, 217) to (359, 162).
; PLAN: r0=436(x1), r1=217(y1), r2=359(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 217
LDI r2, 359
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
