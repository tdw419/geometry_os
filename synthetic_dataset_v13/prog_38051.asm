; DESCRIPTION: Draws a white line from (430, 82) to (459, 31).
; PLAN: r0=430(x1), r1=82(y1), r2=459(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 82
LDI r2, 459
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
