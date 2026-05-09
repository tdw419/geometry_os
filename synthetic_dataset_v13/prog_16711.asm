; DESCRIPTION: Renders a white line between points (267, 115) and (166, 88).
; PLAN: r0=267(x1), r1=115(y1), r2=166(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 115
LDI r2, 166
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
