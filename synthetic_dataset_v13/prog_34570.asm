; DESCRIPTION: Draws a white line from (276, 194) to (117, 11).
; PLAN: r0=276(x1), r1=194(y1), r2=117(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 194
LDI r2, 117
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
