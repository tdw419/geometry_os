; DESCRIPTION: Renders a black line between points (267, 105) and (190, 120).
; PLAN: r0=267(x1), r1=105(y1), r2=190(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 105
LDI r2, 190
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
