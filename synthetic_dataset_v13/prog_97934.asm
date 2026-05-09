; DESCRIPTION: Draws a white line from (222, 96) to (375, 124).
; PLAN: r0=222(x1), r1=96(y1), r2=375(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 96
LDI r2, 375
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
