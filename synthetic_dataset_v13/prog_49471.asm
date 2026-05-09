; DESCRIPTION: Draws a white line from (362, 203) to (343, 114).
; PLAN: r0=362(x1), r1=203(y1), r2=343(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 203
LDI r2, 343
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
