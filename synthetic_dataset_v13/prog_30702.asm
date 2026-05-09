; DESCRIPTION: Draws a white line from (332, 56) to (183, 19).
; PLAN: r0=332(x1), r1=56(y1), r2=183(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 56
LDI r2, 183
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
