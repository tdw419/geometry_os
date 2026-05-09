; DESCRIPTION: Draws a white line from (114, 143) to (49, 63).
; PLAN: r0=114(x1), r1=143(y1), r2=49(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 143
LDI r2, 49
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
