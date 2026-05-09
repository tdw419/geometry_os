; DESCRIPTION: Draws a white line from (51, 40) to (122, 15).
; PLAN: r0=51(x1), r1=40(y1), r2=122(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 40
LDI r2, 122
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
