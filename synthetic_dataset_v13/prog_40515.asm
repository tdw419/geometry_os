; DESCRIPTION: Renders a white line between points (267, 239) and (155, 245).
; PLAN: r0=267(x1), r1=239(y1), r2=155(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 239
LDI r2, 155
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
