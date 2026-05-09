; DESCRIPTION: Draws a white line from (113, 109) to (399, 245).
; PLAN: r0=113(x1), r1=109(y1), r2=399(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 109
LDI r2, 399
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
