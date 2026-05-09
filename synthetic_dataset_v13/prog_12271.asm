; DESCRIPTION: Draws a white line from (399, 158) to (362, 72).
; PLAN: r0=399(x1), r1=158(y1), r2=362(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 158
LDI r2, 362
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
