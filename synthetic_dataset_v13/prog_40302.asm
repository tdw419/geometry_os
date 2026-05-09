; DESCRIPTION: Draws a white line from (56, 52) to (217, 39).
; PLAN: r0=56(x1), r1=52(y1), r2=217(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 52
LDI r2, 217
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
