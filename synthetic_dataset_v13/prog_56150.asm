; DESCRIPTION: Draws a white line from (18, 43) to (358, 5).
; PLAN: r0=18(x1), r1=43(y1), r2=358(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 43
LDI r2, 358
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
