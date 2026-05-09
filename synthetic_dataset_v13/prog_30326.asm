; DESCRIPTION: Draws a white line from (276, 21) to (399, 181).
; PLAN: r0=276(x1), r1=21(y1), r2=399(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 21
LDI r2, 399
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
