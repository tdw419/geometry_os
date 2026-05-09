; DESCRIPTION: Renders a white line between points (267, 248) and (6, 47).
; PLAN: r0=267(x1), r1=248(y1), r2=6(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 248
LDI r2, 6
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
