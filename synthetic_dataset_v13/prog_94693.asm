; DESCRIPTION: Draws a white line from (496, 117) to (332, 135).
; PLAN: r0=496(x1), r1=117(y1), r2=332(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 117
LDI r2, 332
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
