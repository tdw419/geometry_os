; DESCRIPTION: Draws a white line from (267, 105) to (341, 88).
; PLAN: r0=267(x1), r1=105(y1), r2=341(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 105
LDI r2, 341
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
